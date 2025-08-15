<img width="1503" height="1218" alt="image" src="https://github.com/user-attachments/assets/6a50e554-028e-45ef-b336-7e9273c48fe2" />


## Bare Metal AI-Foundation-Model | 🚀🚀🚀 
Unleash the power of AI Inference anywhere. AI foundation models are large, pre-trained AI models that are designed to be versatile and adaptable, capable of performing a wide range of tasks on specific data source. It supports a broad range of hardware platforms, including multi cloud enviroment , ensuring flexibility and scalability to meet diverse enterprise needs.

   
#### 🧱 Key Components:
   - **Kubernetes**: A powerful container orchestration platform that automates the deployment, scaling, and management of containerized applications, ensuring high availability and efficient resource utilization.
   - **Gaudi Base Operator**: A specialized operator that manages the lifecycle of Habana AI resources within the Kubernetes cluster, enabling efficient utilization of Intel® Gaudi® hardware for AI workloads. (Applicable only to Gaudi based deployments)
   - **Ingress NGINX Controller**: A high-performance reverse proxy and load balancer for traffic, responsible for routing incoming requests to the appropriate services within the Kubernetes cluster, ensuring seamless access to deployed AI models.
   - **Keycloak**: An open-source identity and access management solution that provides robust authentication and authorization capabilities, ensuring secure access to AI services and resources within the cluster.
   - **APISIX**: A cloud-native API gateway, handling API traffic and providing advanced features caching, and authentication, enabling efficient and secure access to deployed AI models.
   - **Observability**: An open-source monitoring solution designed to operate natively within Kubernetes clusters, providing comprehensive visibility into the performance, health, and resource utilization of deployed applications and cluster components through metrics, visualization, and alerting capabilities.
   - **Model Deployments**: Automated deployment and management of AI LLM models within the Kubernetes inference cluster, enabling scalable and reliable AI inference capabilities.


🎯 Features 
```
✅ Kubernetes
✅ Gaudi Base Operator
✅ NGINX Controller & APISIX 
```

🔨 Example :
```
terraform init
terraform validate
terraform plan -var-file="template.tfvars"
terraform apply -var-file="template.tfvars" -auto-approve
```


