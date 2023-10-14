QuantifyOneLabel <- function(image = image.object,
                              label.name = 'BASC-like',
                              base.criteria = c('Dapi'),
                              label.criteria = c('Sox9','Abca3'),
                              n.chunks){
  # Split into chunks
  n.chunks <- 20
  test <- split(pn0, (seq(nrow(pn0))-1) %/% (nrow(pn0)/n.chunks)) # break into chunks
  
  # For each chunk, run
  source('QuantFunction.R')
  
  test.output <- lapply(test,FUN = QuantFunction)
  test.output <- dplyr::bind_rows(test.output)
  test.output$chunk <- c(1:nrow(test.output))
  test.output$condition <- 'pn0'
  test.output <- melt(test.output,id.vars = c('condition','chunk'))

  p1 <- ggplot(test.output,aes(x=variable,y=value))+geom_violin()+geom_point()+ theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1))
  
  
  
  # Bind chunk outputs together as a single column of a dataframe with #rows == #chunks
  
}
