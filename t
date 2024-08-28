[1mdiff --git a/.github/workflows/pull-request-trigger.yaml b/.github/workflows/pull-request-trigger.yaml[m
[1mindex f65cd30..a54a170 100644[m
[1m--- a/.github/workflows/pull-request-trigger.yaml[m
[1m+++ b/.github/workflows/pull-request-trigger.yaml[m
[36m@@ -15,10 +15,10 @@[m [mon:[m
       # ! Terraformのディレクトリ構成に従って変更する必要あり[m
       - terraform/**[m
 [m
[31m-# permissions:[m
[31m-#   id-token: write[m
[31m-#   contents: read[m
[31m-#   pull-requests: write[m
[32m+[m[32mpermissions:[m
[32m+[m[32m  id-token: write[m
[32m+[m[32m  contents: read[m
[32m+[m[32m  pull-requests: write[m
 [m
 jobs:[m
   pull_request-triger:[m
[36m@@ -74,4 +74,5 @@[m [mjobs:[m
           # terragrunt run-all plan --terragrunt-non-interactive[m
           terragrunt run-all plan --terragrunt-non-interactive --terragrunt-tfpath $GITHUB_WORKSPACE/.github/workflows/tfcmt-with-terragrunt/tfwrapper.sh[m
         env:[m
[31m-          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}[m
[32m+[m[32m          # GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}[m
[32m+[m[32m          GITHUB_TOKEN: ${{ secrets.PERSONAL_ACCESS_TOKEN }}[m
