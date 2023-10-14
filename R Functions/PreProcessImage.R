PreProcessImage <- function(images.raw,
                            box.dim = 20,
                            offset = 0.1){
  # Normalize each channel
  message('Normalizing data...')
  images.norm <- list()
  for(i in 1:length(channel.names)){
    images.norm[[channel.names[i]]] <- EBImage::normalize(images.raw[[i]])
  }
  # Adaptive thresholding approach
  message('Running adaptive thresholding....')
  img.dapi.thresh <- thresh(img.dapi,w=box.dim, h=box.dim, offset=offset)
  img.abca3.thresh <- thresh(img.abca3,w=box.dim, h=box.dim, offset=offset)
  img.sox9.thresh <- thresh(img.sox9,w=box.dim, h=box.dim, offset=offset)
  img.edu.thresh <- thresh(img.edu,w=box.dim, h=box.dim, offset=offset)
  
  return(images.processed)
}
