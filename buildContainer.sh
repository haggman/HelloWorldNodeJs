PROJECT_ID=$GOOGLE_CLOUD_PROJECT  # Replace with your actual project ID
LOCATION="us"         # Replace with your desired region (e.g., "us-central1")
REPOSITORY="demos" # Replace with your desired repository name
FULL_REPO="${LOCATION}-docker.pkg.dev/${PROJECT_ID}/${REPOSITORY}"
# Check if the repository exists
if ! gcloud artifacts repositories describe "${REPOSITORY}" --location="${LOCATION}" --project="${PROJECT_ID}" &>/dev/null; then
    echo "Repository '$REPOSITORY' does not exist. Creating..."

    # Create the repository
    gcloud artifacts repositories create "${REPOSITORY}" \
        --repository-format=docker \
        --location="${LOCATION}" \
        --project="${PROJECT_ID}"
    echo "Repository '$FULL_REPO' created successfully."
else
    echo "Repository '$FULL_REPO' already exists."
fi

IMAGE_NAME="${FULL_REPO}/hello-world-demo:latest"

# To use Cloud Build and the Dockerfile:
gcloud builds submit --tag $IMAGE_NAME .

# To use the Google Cloud buildpack:
# gcloud auth configure-docker ${LOCATION}-docker.pkg.dev

# pack build "${IMAGE_NAME}" \
#   --builder gcr.io/buildpacks/builder \
#   --env GOOGLE_NODEJS_VERSION=24.x.x

# docker push "${IMAGE_NAME}"
