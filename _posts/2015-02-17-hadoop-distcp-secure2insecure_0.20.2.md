---
layout: page
title: "hadoop distcp from secure to insecure 0.20.2"
date: 2015-02-17 17:14
comments: true
categories: hadoop 

---
# Background

When secure hadoop 0.20.2 want to access insecure hadoop 0.20.2, espeically for using distcp on hdfs,
  the job (distcp) will try to get token for both source and destination FileSystem.
  However, the insecure hadoop will return null token for disabled security option, which
  let secure hadoop client(DFSClient) throw NPE and job failed. Hence, we need to upgrade
  hadoop client code about getDelegationToken to work around this case. <!-- more -->

# Solution

## Step 1

For null token received in DFSClient#getDelegationToken, not print it with stringifyToken

  <pre>
  <code>
      // For insecure, result will be null, and throwing NPE by stringifyToken
      if(result != null){
        LOG.info("Created " + stringifyToken(result));
      }else{
        // for null token, handled by DistributedFileSystem for creating an dummy token.
        LOG.info("Created null token!");
      }
  </code>
  </pre>
  

## Step 2

For null token received in DistributedFileSystem#getDelegationToken, return a new dummy Token
   <pre>
   <code>
   result = new Token<DelegationTokenIdentifier>(identifier,password,kind,service);
   <code>
   </pre>
   

## Step 3 

Build new hadoop-core and deploy
   <pre>
      1. ant
      2. scp build/hadoop-core-0.20.2-cdh3u1.jar xxxx@xxxxx:/yourpath/
   </pre>

## Step 4

Set CLASSPATH using this new hadoop client jar.

   1. Only local support, let hadoop search HADOOP_CLASSPATH first for class loading.
   <pre>
       export HADOOP_CLASSPATH=/yourpath/hadoop-core-0.20.2-cdh3u1.jar
       export HADOOP_USER_CLASSPATH_FIRST=true
   </pre>

   2. For every node in secure cluster using this new jar.
   In most case, the job will get all required token, and set it into its Credential, which will make
   any other nodes in this cluster share this token.  So usually there is no need for every node upgrades this new client,
   which will also pollute the secure cluster. Please add the following code into the code of your hadoop job:
   <pre>
        job.getConfiguration().set("mapreduce.job.user.classpath.first", "true");
   </pre>


## Step 5
Just run your job as usually.


