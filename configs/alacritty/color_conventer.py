#!/usr/bin/env python3
"""
Quickshell sequences to Alacritty TOML converter
Usage: python3 quickshell_to_alacritty.py
"""
import os
import re
from pathlib import Path

HOME = os.getenv("HOME")
SEQUENCES_FILE = f"{HOME}/.local/state/quickshell/user/generated/terminal/sequences.txt"
OUTPUT_FILE = f"{HOME}/.config/alacritty/colorthemes/material_colors.toml"


def parse_sequences(filepath):
    """Parse sequences.txt file and return a dict of colors"""
    palette = {}
    try:
        with open(filepath, "r") as f:
            content = f.read()
            
            # Parse terminal colors: ]4;N;#RRGGBB
            for match in re.finditer(r'\]4;(\d+);#([0-9A-Fa-f]{6})', content):
                color_index = int(match.group(1))
                hex_color = "#" + match.group(2).lower()
                palette[f"term{color_index}"] = hex_color
            
            # Parse foreground (]10;#RRGGBB)
            match = re.search(r'\]10;#([0-9A-Fa-f]{6})', content)
            if match:
                palette["foreground"] = "#" + match.group(1).lower()
            
            # Parse background (]11;#RRGGBB)
            match = re.search(r'\]11;#([0-9A-Fa-f]{6})', content)
            if match:
                palette["background"] = "#" + match.group(1).lower()
                
    except FileNotFoundError:
        print(f"Error: file {filepath} not found")
        return None
    
    return palette


def generate_alacritty_config(palette):
    """Generate Alacritty config from palette"""
    
    # Default fallbacks
    defaults = {
        "foreground": "#ffffff",
        "background": "#282828",
        "term0": "#282828",
        "term1": "#ff0000",
        "term2": "#00ff00",
        "term3": "#ffff00",
        "term4": "#0000ff",
        "term5": "#ff00ff",
        "term6": "#00ffff",
        "term7": "#ffffff",
        "term8": "#808080",
        "term9": "#ff8080",
        "term10": "#80ff80",
        "term11": "#ffff80",
        "term12": "#8080ff",
        "term13": "#ff80ff",
        "term14": "#80ffff",
        "term15": "#c0c0c0",
    }
    
    # Merge with parsed palette
    colors = {**defaults, **palette}
    
    config = """# Auto-generated Alacritty config from Quickshell palette
[colors]

[colors.primary]
background = "{background}"
foreground = "{foreground}"

[colors.normal]
black = "{term0}"
red = "{term1}"
green = "{term2}"
yellow = "{term3}"
blue = "{term4}"
magenta = "{term5}"
cyan = "{term6}"
white = "{term7}"

[colors.bright]
black = "{term8}"
red = "{term9}"
green = "{term10}"
yellow = "{term11}"
blue = "{term12}"
magenta = "{term13}"
cyan = "{term14}"
white = "{term15}"

[colors.cursor]
text = "{background}"
cursor = "{foreground}"

[colors.selection]
text = "{background}"
background = "{term7}"

[colors.search]
matches = { foreground = "{background}", background = "{term3}" }
focused_match = { foreground = "{background}", background = "{term11}" }

[colors.hints]
start = { foreground = "{background}", background = "{term3}" }
end = { foreground = "{background}", background = "{term11}" }

[colors.line_indicator]
foreground = "None"
background = "None"

[colors.footer_bar]
background = "{term0}"
foreground = "{foreground}"
"""
    
    # Replace variables with colors
    for var, color in colors.items():
        config = config.replace("{" + var + "}", color)
    
    return config


def main():
    print(f"Loading palette from {SEQUENCES_FILE}...")
    palette = parse_sequences(SEQUENCES_FILE)
    
    if not palette:
        return
    
    print(f"Found {len(palette)} colors")
    for color_name, hex_value in sorted(palette.items()):
        print(f"  {color_name}: {hex_value}")
    
    config = generate_alacritty_config(palette)
    
    # Create directory if it doesn't exist
    Path(OUTPUT_FILE).parent.mkdir(parents=True, exist_ok=True)
    
    with open(OUTPUT_FILE, "w") as f:
        f.write(config)
    
    print(f"\n✓ Config saved to {OUTPUT_FILE}")
    print("\nAdd to your Alacritty config (~/.config/alacritty/alacritty.toml):")
    print(f'import = ["{OUTPUT_FILE}"]')


if __name__ == "__main__":
    main()
