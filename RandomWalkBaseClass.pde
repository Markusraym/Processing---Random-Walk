import controlP5.*; //<>//
ControlP5 cp5;
DropdownList d1;

Textlabel maxSteplabel;
Textlabel stepRatelabel;
Textlabel stepSizelabel;
Textlabel stepScalelabel;
RandomWalk walk;
boolean start = false;

abstract class RandomWalk
{
  abstract void Update();
  String stringSeedValue = " ";
  int seedValue = 0;
  float stepScale = 1.0f;
  int maxSteps = 100;
  int stepRate = 1; //Indicate how many steps to take in a single frame
  int stepSize = 10; //How big the square or hexagon should be
  boolean constrainSteps = false; //If the steps can go out of the window
  boolean simulateTerrain = false; //Color the steps when they have more steps in that location
  int randomSeed = 0;
  boolean useRandomSeed = true;
  boolean useStroke = false;
  int randomNumber = 0; //The number that will hold a 0 - 3 value for going up down left and right

  int x = 600; //x value to keep track of the position
  int y = 400; //y value to keep track of the position
  int sizeWidth = stepSize;
  int sizeHeight = stepSize;
  //Add variables for hexagon and square dropdown

  int stepCount = 0;
  int stepDistance = 0;
  boolean colorToggle = false;
  boolean strokeToggle = false;
  int xBoundary = 0;
  int yBoundary = 0;
}

//Global Variables
boolean sliderStart = false;
int sliderMaxSteps = 100;
int sliderStepRate = 1;
int sliderStepSize = 10;
float sliderStepScale = 1.0f;
boolean sliderConstrainSteps = false;
boolean sliderSimulateTerrain = false;
boolean sliderUseStroke = false;
boolean sliderUseRandomSeed = true;
String sliderSeedValue = " ";

void updateVariables() //This updates the values of the walk object every time start is pressed
{
  walk.maxSteps = sliderMaxSteps;
  walk.stepRate = sliderStepRate;
  walk.stepSize = sliderStepSize;
  walk.stepScale = sliderStepScale;
  walk.constrainSteps = sliderConstrainSteps;
  walk.simulateTerrain = sliderSimulateTerrain;
  walk.useStroke = sliderUseStroke;
  walk.useRandomSeed = sliderUseRandomSeed;
  walk.stringSeedValue = sliderSeedValue; //the string seed value from slider is equal to the walk.stringseedvalue
}

void setup()
{
  size(1200, 800);
  background(0, 150, 255);
  fill(100);
  rect(0, 0, 275, height-1);
  cp5 = new ControlP5(this);

  cp5.addButton("START") //Adding the start button
    .setValue(1)
    .setPosition(10, 10)
    .setSize(90, 35)
    .setColorBackground(#228B22)
    ;

  d1 = cp5.addDropdownList("SQUARES") //Add dropdown list for squares of hexagons, when click on hexagons squares disapears. fix!
    .setPosition(10, 55)
    .setSize(150, 500)
    .setBarHeight(50)
    .setItemHeight(50)
    .addItem("HEXAGONS", 1)
    .addItem("SQUARES", 0)
    ;

  cp5.addSlider("sliderMaxSteps") //Slider for the maximum steps
    .setPosition(10, 235)
    .setRange(100, 50000)
    .setSize(200, 25)
    .getCaptionLabel().setVisible(false)
    ;

  maxSteplabel = cp5.addTextlabel("Maximum Steps").setText("Maximum Steps").setPosition(10, 223); //Add label for the maximum steps label

  cp5.addSlider("sliderStepRate") //Slider for the step rate slider
    .setPosition(10, 285)
    .setSize(200, 25)
    .setRange(1, 1000)
    .getCaptionLabel().setVisible(false)
    ;
  stepRatelabel = cp5.addTextlabel("Step Rate").setText("Step Rate").setPosition(10, 273); //Add label for the step rate slider

  cp5.addSlider("sliderStepSize") //Add slider for the step size
    .setPosition(10, 355)
    .setSize(75, 25)
    .setRange(10, 30)
    .getCaptionLabel().setVisible(false)
    ;
  stepSizelabel = cp5.addTextlabel("Step Size").setText("Step Size").setPosition(10, 343); //Add label for step size slider

  cp5.addSlider("sliderStepScale") //Adds slider for the step scale
    .setPosition(10, 400)
    .setSize(75, 25)
    .setRange(1.0, 1.5)
    .getCaptionLabel().setVisible(false)
    ;
  stepScalelabel = cp5.addTextlabel("Step Scale").setText("Step Scale").setPosition(10, 390); //label for the step scale slider

  cp5.addToggle("sliderConstrainSteps").setPosition(10, 480).setSize(25, 25).setCaptionLabel("CONSTRAIN STEPS");
  cp5.addToggle("sliderSimulateTerrain").setPosition(10, 525).setSize(25, 25).setCaptionLabel("SIMULATE TERRAIN");
  cp5.addToggle("sliderUseStroke").setPosition(10, 570).setSize(25, 25).setCaptionLabel("USE STROKE");
  cp5.addToggle("sliderUseRandomSeed").setPosition(10, 620).setSize(25, 25).setCaptionLabel("USE RANDOM SEED");

  cp5.addTextfield("sliderSeedValue")
    .setPosition(90, 620)
    .setSize(45, 25)
    .setCaptionLabel("SEED VALUE")
    .setInputFilter(ControlP5.INTEGER)
    .getText();
}

void START()
{
  //execute and make the initiliaztion of base class when start is pressed
  rectMode(CORNER);
  background(0, 150, 255);
  rect(0, 0, 275, height-1);
  if (d1.getValue() == 1.0f) // Call the square Class
  {
    walk = new SquareClass();
    updateVariables();
  } else if (d1.getValue() == 0.0f) // Call the hexagon Class
  {
    walk = new HexagonClass();
    updateVariables();
  }
  walk.x = width/2;
  walk.y = height/2;
  walk.stepCount = 0;
  start = !start;
  //if statement that inputs the custom seed value if the user chooses to enable it
  if (walk.useRandomSeed == false)
  {
    walk.seedValue = Integer.parseInt(walk.stringSeedValue);
    randomSeed(walk.seedValue);
  }
    walk.sizeWidth = walk.stepSize;
    walk.sizeHeight = walk.stepSize;
}

void draw()
{
  if (start == true)
  {
    walk.Update();
  }
}
