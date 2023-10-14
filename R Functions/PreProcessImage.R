PreProcessImage <- function(images.raw,
                            box.dim = 20,
                            offset = 0.1){
  # Identify channel names
  channel.names <- names(images.raw)
  message(paste('Using',paste(channel.names,collapse=" & "),'as channels...'))
  
  # Normalize each channel
  message('Normalizing data...')
  images.norm <- list()
  for(i in 1:length(channel.names)){
    images.norm[[channel.names[i]]] <- EBImage::normalize(images.raw[[i]])
  }
  
  # Adaptive thresholding approach
  message('Running adaptive thresholding....')
  images.processed <- list()
  for(i in 1:length(channel.names)){
  images.processed[[channel.names[i]]] <- thresh(images.norm[[channel.names[i]]],w=box.dim, h=box.dim, offset=offset)
  }

  return(images.processed)
}
