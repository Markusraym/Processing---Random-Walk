import java.util.Map;
import java.util.*;
import java.util.Map.Entry.*;
import java.util.Map.*;
import java.util.Iterator.*;
import java.util.HashMap.*;

class SquareClass extends RandomWalk
{
  void  Update()
  {
    HashMap<PVector, Integer> terrain = new HashMap<PVector, Integer>();
    Iterator<Map.Entry<PVector, Integer>> iterator = terrain.entrySet().iterator();
    Iterator<Map.Entry<PVector, Integer>> iterator2 = terrain.entrySet().iterator();
    float floatX = 0.0f;
    float floatY = 0.0f;
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
      rectMode(CENTER);
      if (stepCount < maxSteps)
      {
        int counter = 0; 
        int repeat = 0;
        
          //Go through the hashmap and look for the most recent x,y value 
         while (iterator.hasNext())
        {
          Map.Entry<PVector, Integer> new_Map2 = (Map.Entry<PVector, Integer>)iterator.next();
          if ((new_Map2.getKey().x == x) && (new_Map2.getKey().y == y))
          {
             repeat = new_Map2.getValue();   
          }
        }
        /*
        if (repeat < 4)
        {
          fill(160, 126, 84);
        }
        else if (repeat < 7)
        {
          fill(143, 170, 64);
        }
        else if (repeat < 10)
        {
          fill(135, 135, 135);
        }
        else if (repeat > 20)
        {
          fill(255, 255, 255);
        }  */      
        
        if (constrainSteps == false)
        {
          walk.randomNumber = (int)random(0, 4);
          if (randomNumber == 0) // Go up
          {
            y = y - stepSize;
            floatY = float(y) * stepScale;
            floatX = float(x) * stepScale;
            //Function that gets called here, where it iterates the map getting the counter value 
            rect(floatX, floatY, sizeWidth, sizeHeight);
          } else if (randomNumber == 1) //Go to the right
          {
            x = x + stepSize;
            floatX = float(x) * stepScale;
            floatY = float(y) * stepScale;
            rect(floatX, floatY, sizeWidth, sizeHeight);
          } else if (randomNumber == 2) //Go down
          {
            y = y + stepSize;
            floatY = float(y) * stepScale;
            floatX = float(x) * stepScale;
            rect(floatX, floatY, sizeWidth, sizeHeight);
          } else if (randomNumber == 3) //go to the left
          {
            x = x - stepSize;
            floatX = float(x) * stepScale;
            floatY = float(y) * stepScale;
            rect(floatX, floatY, sizeWidth, sizeHeight);
          }
          stepCount++;
        } else if (constrainSteps == true) //Repeat of the previous code but with constraining
        {
          walk.randomNumber = (int)random(0, 4);
          if ((randomNumber == 0) && y > stepSize) // Go up
          {
            y = y - stepSize;
            floatY = float(y) * stepScale;
            floatX = float(x) * stepScale;
            rect(floatX, floatY, sizeWidth, sizeHeight);
          } else if ((randomNumber == 1) && x < width - stepSize) //Go to the right
          {
            x = x + stepSize;
            floatX = float(x) * stepScale;
            floatY = float(y) * stepScale;
            rect(floatX, floatY, sizeWidth, sizeHeight);
          } else if ((randomNumber == 2) && y < height - stepSize) //Go down
          {
            y = y + stepSize;
            floatY = float(y) * stepScale;
            floatX = float(x) * stepScale;
            rect(floatX, floatY, sizeWidth, sizeHeight);
          } else if ((randomNumber == 3) && x > 280) //go to the left, 280 accounts for the gray box.
          {
            x = x - stepSize;
            floatX = float(x) * stepScale;
            floatY = float(y) * stepScale;
            rect(floatX, floatY, sizeWidth, sizeHeight);
          }
          stepCount++;
        }
        
        PVector squareVector = new PVector(x, y);
             
        while (iterator2.hasNext())
        {
          println("iterator2");
          Map.Entry<PVector, Integer> new_Map = (Map.Entry<PVector, Integer>)iterator2.next();
          if ((new_Map.getKey().x - x == 0) && (new_Map.getKey().y - y == 0))
          {
            counter++;
          }
        }
        terrain.put(squareVector, counter);
        
      }
    }
  }
}
