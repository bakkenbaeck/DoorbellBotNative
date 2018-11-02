package com.bakkenbaeck.doorbellbotnative

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import kotlinx.android.synthetic.main.activity_main.mainText
import com.bakkenbaeck.doorbellbotnative.common.createApplicationScreenMessage

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        init()
    }

    private fun init() {
        mainText.text = createApplicationScreenMessage()
    }
}
