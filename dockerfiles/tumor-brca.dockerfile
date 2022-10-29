# Breast cancer tumor detection model (resnet34).
#
# Note about versioning: We should not use the 'latest' tag because it is a moving
# target. We should prefer using a versioned release of the wsi_inference pipeline.
FROM kaczmarj/patch-classification-pipeline:v0.2.0

# The CLI will use these env vars for model and weights.
ENV WSIRUN_MODEL="resnet34"
ENV WSIRUN_WEIGHTS="TCGA-BRCA-v1"

# Download the weights.
RUN python -c "from wsi_inference.modellib import models; models.$WSIRUN_MODEL(\"$WSIRUN_WEIGHTS\")"
# Downloaded models are mode 0600. Make them readable by all users.
RUN chmod -R +r $TORCH_HOME/hub/checkpoints/