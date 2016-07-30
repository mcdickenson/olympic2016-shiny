library(shiny)

data = read.csv('athletes_shiny.csv', header=TRUE, as.is=TRUE)

distance3d = function(x1, x2, y1, y2, z1, z2){
  return( sqrt( (x1-x2)^2 + (y1-y2)^2 + (z1-z2)^2 ) )
}

mostSimilarAthlete = function(age, height, weight, gender){
  similar = NA
  distance = 1000000
  subset = data[which(data$gender==gender), ]
  for(i in 1:nrow(subset)){
    row  = subset[i,]
    dist = distance3d(age, row['age'], height, row['height'], weight, row['weight'])
    if(dist < distance){
      distance = dist
      similar = i
    }
  }
  return(subset[similar,])
}

shinyServer(function(input, output){
  output$whoami = renderText({
    most_similar = mostSimilarAthlete(strtoi(input$myAge), strtoi(input$myHeight), strtoi(input$myWeight), input$myGender)
    paste("<div style='text-align: center;'><img src='" ,
      most_similar$img,
      "' width='200' style='display: block; margin-left: auto; margin-right: auto;'><br /><a href='",
      most_similar$link,
      "'>",
      most_similar$name,
      " (",
      most_similar$sport,
      ")",
      "</a></div>",
      sep="")
  })
})