library(shiny)

data = read.csv('athletes_shiny.csv', header=TRUE, as.is=TRUE)

distance3d = function(x1, x2, y1, y2, z1, z2){
  return( sqrt( (x1-x2)^2 + (y1-y2)^2 + (z1-z2)^2 ) )
}

mostSimilarAthlete = function(age, height, weight){
  similar = NA
  distance = 1000000
  for(i in 1:nrow(data)){
    row  = data[i,]
    dist = distance3d(age, row['age'], height, row['height'], weight, row['weight'])
    if(dist < distance){
      distance = dist
      similar = i #row$name
    }
  }
  return(similar)
}

shinyServer(function(input, output){
  output$whoami = renderText({
    most_similar_ix = mostSimilarAthlete(strtoi(input$myAge), strtoi(input$myHeight), strtoi(input$myWeight))
    most_similar = data[most_similar_ix, ]
    paste("<img src='" ,
      most_similar$img,
      "' width='200'><br /><a href='",
      most_similar$link,
      "''>",
      most_similar$name,
      " (",
      most_similar$sport,
      ")",
      "</a>",
      sep="")
  })
})