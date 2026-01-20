package com.ute.calculadora

import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import com.google.android.material.appbar.MaterialToolbar

class MainActivity : AppCompatActivity() {

    private lateinit var tvDisplay: TextView
    private var current = "0"
    private var last: String? = null
    private var op: Char? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_calculator)

        findViewById<MaterialToolbar>(R.id.toolbar)?.setNavigationOnClickListener { finish() }
        tvDisplay = findViewById(R.id.tvDisplay)

        val btn0 = findViewById<Button>(R.id.btn0)
        val btn1 = findViewById<Button>(R.id.btn1)
        val btn2 = findViewById<Button>(R.id.btn2)
        val btn3 = findViewById<Button>(R.id.btn3)
        val btn4 = findViewById<Button>(R.id.btn4)
        val btn5 = findViewById<Button>(R.id.btn5)
        val btn6 = findViewById<Button>(R.id.btn6)
        val btn7 = findViewById<Button>(R.id.btn7)
        val btn8 = findViewById<Button>(R.id.btn8)
        val btn9 = findViewById<Button>(R.id.btn9)

        listOf<Button>(btn0,btn1,btn2,btn3,btn4,btn5,btn6,btn7,btn8,btn9).forEach { b ->
            b.setOnClickListener { inputDigit(b.text.toString()) }
        }

        findViewById<Button>(R.id.btnDot).setOnClickListener { inputDot() }
        findViewById<Button>(R.id.btnAdd).setOnClickListener { handleOp('+') }
        findViewById<Button>(R.id.btnSub).setOnClickListener { handleOp('-') }
        findViewById<Button>(R.id.btnMul).setOnClickListener { handleOp('*') }
        findViewById<Button>(R.id.btnDiv).setOnClickListener { handleOp('/') }
        findViewById<Button>(R.id.btnEq).setOnClickListener  { handleOp('=') }
        findViewById<Button>(R.id.btnAC).setOnClickListener   { reset() }
        findViewById<Button>(R.id.btnBack).setOnClickListener { backspace() }

        updateDisplay()
    }

    private fun inputDigit(d: String) {
        current = if (current == "0") d else current + d
        updateDisplay()
    }

    private fun inputDot() {
        if (!current.contains(".")) {
            current += if (current.isEmpty()) "0." else "."
            updateDisplay()
        }
    }

    private fun handleOp(nextOp: Char) {
        if (op != null && last != null) {
            val a = last!!.toDoubleOrNull() ?: 0.0
            val b = current.toDoubleOrNull() ?: 0.0
            val r = when (op) {
                '+' -> a + b
                '-' -> a - b
                '*' -> a * b
                '/' -> if (b == 0.0) Double.NaN else a / b
                else -> b
            }
            last = if (r.isNaN()) "Error" else trim(r)
            current = "0"
            updateDisplay(last)
        } else {
            last = current
            current = "0"
            updateDisplay(last)
        }
        op = if (nextOp == '=') null else nextOp
    }

    private fun reset() { current = "0"; last = null; op = null; updateDisplay() }
    private fun backspace() { current = if (current.length > 1) current.dropLast(1) else "0"; updateDisplay() }

    private fun trim(value: Double): String {
        val s = String.format("%.6f", value).trimEnd('0').trimEnd('.')
        return if (s.length > 12) s.take(12) else s
    }

    private fun updateDisplay(override: String? = null) {
        tvDisplay.text = (override ?: current)
    }
}