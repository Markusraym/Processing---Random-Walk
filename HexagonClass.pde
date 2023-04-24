class HexagonClass extends RandomWalk //<>//
{
  //Values for the x and y coordinates for the hexagons
  float xValue = 700;
  float yValue = 400;
  void  Update()
  { 
    //Enables or disables stroke if user chooses to do so
    if (useStroke == true)
    {
      stroke(0);
    } else if (useStroke == false)
    {
      noStroke();
    }
    for (int i = 0; i < stepRate; i++)
    {
      if (stepCount < maxSteps)
      {
        if (constrainSteps == false)
        {
          println("x val: " + xValue);
          println("y val: " + yValue);
          randomNumber = (int)random(1, 7);
          if (randomNumber == 1) // Down and to the right
          {
            xValue += cos(radians(330)) * sqrt(3) * stepSize * stepScale;
            yValue += sin(radians(330)) * sqrt(3) * stepSize * stepScale;
            polygon(xValue, yValue, stepSize);
          } else if (randomNumber == 2) // Go down
          {
            xValue += cos(radians(270)) * sqrt(3) * stepSize * stepScale;
            yValue += sin(radians(270)) * sqrt(3) * stepSize * stepScale;
            polygon(xValue, yValue, stepSize);
          } else if (randomNumber == 3) //Go down and to the left
          {
            xValue += cos(radians(210)) * sqrt(3) * stepSize * stepScale;
            yValue += sin(radians(210)) * sqrt(3) * stepSize * stepScale;
            polygon(xValue, yValue, stepSize);
          } else if (randomNumber == 4) //Go up and to the left
          {
            xValue += cos(radians(150)) * sqrt(3) * stepSize * stepScale;
            yValue += sin(radians(150)) * sqrt(3) * stepSize * stepScale;
            polygon(xValue, yValue, stepSize);
          } else if (randomNumber == 5) //Go up
          {
            xValue += cos(radians(90)) * sqrt(3) * stepSize * stepScale;
            yValue += sin(radians(90)) * sqrt(3) * stepSize * stepScale;
            polygon(xValue, yValue, stepSize);
          } else if (randomNumber == 6) //Go up and to the right
          {
            xValue += cos(radians(30)) * sqrt(3) * stepSize * stepScale;
            yValue += sin(radians(30)) * sqrt(3) * stepSize * stepScale;
            polygon(xValue, yValue, stepSize);
          }
          stepCount++;
        } else if (constrainSteps == true)//Repeat of the previous code but with constraining
        {
         println("x val: " + xValue);
         println("y val: " + yValue);
          randomNumber = (int)random(1, 7);
          if ((randomNumber == 1) && (xValue < width) && (yValue < height-1)) // Down and to the right
          {
            xValue += cos(radians(330)) * sqrt(3) * stepSize * stepScale;
            yValue += sin(radians(330)) * sqrt(3) * stepSize * stepScale;
            polygon(xValue, yValue, stepSize);
          } else if ((randomNumber == 2) && (yValue < height-1) && (yValue > 0)) // Go down
          {
            xValue += cos(radians(270)) * sqrt(3) * stepSize * stepScale;
            yValue += sin(radians(270)) * sqrt(3) * stepSize * stepScale;
            polygon(xValue, yValue, stepSize);
          } else if ((randomNumber == 3) && (xValue > 280) && (yValue < height-1)) //Go down and to the left
          {
            xValue += cos(radians(210)) * sqrt(3) * stepSize * stepScale;
            yValue += sin(radians(210)) * sqrt(3) * stepSize * stepScale;
            polygon(xValue, yValue, stepSize);
          } else if ((randomNumber == 4) && (xValue > 280) && (yValue > 0) && (yValue < height-1)) //Go up and to the left
          {    
            xValue += cos(radians(150)) * sqrt(3) * stepSize * stepScale;
            yValue += sin(radians(150)) * sqrt(3) * stepSize * stepScale;
            polygon(xValue, yValue, stepSize);
          } else if ((randomNumber == 5) && (yValue > 0) && (yValue < height-1)) //Go up
          {
            xValue += cos(radians(90)) * sqrt(3) * stepSize * stepScale;
            yValue += sin(radians(90)) * sqrt(3) * stepSize * stepScale;
            polygon(xValue, yValue, stepSize);
          } else if ((randomNumber == 6) && (xValue < width-1) && (yValue > 0) && (yValue < height-1)) //Go up and to the right
          {
            xValue += cos(radians(30)) * sqrt(3) * stepSize * stepScale;
            yValue += sin(radians(30)) * sqrt(3) * stepSize * stepScale;
            polygon(xValue, yValue, stepSize);
        }
        stepCount++;
      }
    }
  }
}
//Credit towards the example on processing's website at https://processing.org/examples/regularpolygon.html and professor Fox's example in HexTest. 
void polygon(float xVal, float yVal, float radius) {
  int degrees = 60;
  beginShape();
  for (float i = 0; i <= degrees(TWO_PI); i += degrees) {
    float sx = xVal + cos(radians(i)) * radius;
    float sy = yVal + sin(radians(i)) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
}
