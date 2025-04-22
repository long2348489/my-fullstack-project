**PROJECT DIAGRAM**

![alt text](report-resources/Infradiagram.drawio.png)

**PROJECT STRUCTURE**

1. app.api → Contains the API implementation with a self-implemented OAuth2 system. The codebase is written in ExpressJs.
2. app.tf → Contains Terraform scripts for provisioning infrastructure.
3. app.eksconfig → Contains the configuration and setup for the EKS cluster.
4. logs → This folder is automatically created after running the application.
5. .github → Contains the CI/CD pipeline configuration.
6. report-resources → Contains the images for reporting

**GIT REPO**

The repository has two branches: dev and main.

**CONNECT DB**

![alt text](report-resources/connectDB)

<span style="background-color:#000; color:#fff; padding:5px">Chữ trắng nền đen</span>