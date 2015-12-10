package com.example.dawsonbotsford.final_botsford;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.ToggleButton;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    //Get's the name for this pizza from the edit text at top of app
    private String getPizzaName(){
        EditText pizza_Name_EditText = (EditText) findViewById(R.id.pizzaName);
        return pizza_Name_EditText.getText().toString();
    }

    //Get's the user's choice for gluten free or not from the slider
    private String getGlutenFree(){
        Switch gf_Switch = (Switch) findViewById(R.id.gluten_free);
        boolean choice = gf_Switch.isChecked();

        if (choice) {
            return "gluten-free pizza";
        }
        else {
            return "gluten-free eater's ENEMY";
        }
    }

    //Get's the user's choice for white or red sauce from the toggle button
    private String getSauce(){
        ToggleButton sauce_Button = (ToggleButton) findViewById(R.id.sauce_color);
        return sauce_Button.getText().toString();
    }

    private String getSize(){
        Spinner size_Spinner = (Spinner) findViewById(R.id.size_spinner);
        return size_Spinner.getSelectedItem().toString();
    }

    public void buildPizza(View v){
        String phrase;

        phrase = "Your " + getSize() + " pizza is called the " + getPizzaName() + ". It has " + getSauce() + " and is clearly healthy because it is a " + getGlutenFree();

        TextView final_phrase_EditText = (TextView) findViewById(R.id.finalPhrase);
        final_phrase_EditText.setText(phrase);

    }
}
