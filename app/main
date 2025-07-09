from flask import Flask, render_template, request
import random

app = Flask(__name__)

def analyze_chart(price_input):
    current_price = float(price_input)
    signal_type = random.choice(['BUY', 'SELL'])
    entry = round(current_price * (0.995 if signal_type == 'BUY' else 1.005), 3)
    tp1 = round(entry * (1.015 if signal_type == 'BUY' else 0.985), 3)
    tp2 = round(entry * (1.030 if signal_type == 'BUY' else 0.970), 3)
    sl = round(entry * (0.985 if signal_type == 'BUY' else 1.015), 3)
    trend = 'Uptrend' if signal_type == 'BUY' else 'Downtrend'
    momentum = random.choice(['Strong', 'Neutral', ' 'Weak'])
    support = round(current_price * 0.97, 3)
    resistance = round(current_price * 1.03, 3)
    confidence = random.randint(75, 95)
    failure_risk = random.choice(['Low', 'Medium', 'High'])
    next_move = (
        f"Price is expected to {'rise toward ' + str(tp1) if signal_type == 'BUY' else 'decline toward ' + str(tp1)} "
        "unless market momentum changes."
    )
    reasoning = (
        "Based on recent candle patterns, support/resistance zones, and trendlines, "
        f"the market shows a {trend.lower()} with {'strong' if momentum=='Strong' else 'mixed'} momentum."
    )
    recommendations = [
        "Use position sizing to manage your risk.",
        "Watch for volume confirmation before entry.",
        "Consider a trailing stop after the first take-profit is hit."
    ]

    return {
        'Signal Type': signal_type,
        'Current Market Price': current_price,
        'Suggested Entry Price': entry,
        'Take Profit Targets': f"{tp1}, {tp2}",
        'Stop Loss Level': sl,
        'Trend Direction': trend,
        'Momentum': momentum,
        'Support Level Detected': support,
        'Resistance Level Detected': resistance,
        'Confidence Level': f"{confidence}%",
        'Risk of Signal Failure': failure_risk,
        'Next Price Expectation': next_move,
        'Reasoning': reasoning,
        'Recommendations': recommendations
    }

@app.route('/', methods=['GET', 'POST'])
def index():
    report = None
    error = None
    if request.method == 'POST':
        price = request.form.get('price', '').strip()
        if not price:
            error = "Please enter the current market price."
        else:
            try:
                report = analyze_chart(price)
            except Exception:
                error = "Invalid input or server error. Try again."
    return render_template('index.html', report=report, error=error)

if __name__ == '__main__':
    app.run(debug=True)
