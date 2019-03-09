# UMN-SCOM

[![Build Status](https://dev.azure.com/umn-microsoft/UMN-SCOM/_apis/build/status/umn-microsoft-automation.UMN-SCOM?branchName=build-pipeline)](https://dev.azure.com/umn-microsoft/UMN-SCOM/_build/latest?definitionId=1&branchName=build-pipeline) [![Build status](https://ci.appveyor.com/api/projects/status/ygkok8d5y96wcbhh?svg=true)](https://ci.appveyor.com/project/FISHMANPET/umn-scom)

## Update '1.0.0'

This is the initial release.

The Function Restart-SCOMHealth is meant to stop the SCOM agent service delete the health log files then start the service which repopulates the log and should get new heartbeat.
