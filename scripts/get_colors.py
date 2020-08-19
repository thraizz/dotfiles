#!/usr/bin/env python3

import sys
import numpy as np
#import matplotlib.pyplot as plt
#from mpl_toolkits.mplot3d import Axes3D
from PIL import Image, ImageDraw


# Our ideal colors we want to have for our palette
ideal_colors = {
                "Black": np.array([0, 0, 0]),
                "Red": np.array([255, 100, 50]), 
                "Green": np.array([30, 235, 30]), 
                "Brown/Yellow": np.array([216, 138, 41]),
                "Blue": np.array([0, 0, 255]),
                "Magenta": np.array([255, 0, 255]),
                "Cyan": np.array([0, 255, 255]),
                "Light Grey": np.array([211, 211, 211]),
                "Dark Grey": np.array([76, 86, 106]),
                "Light Red": np.array([255, 132, 69]),
                "Light Green": np.array([128, 255, 128]),
                "Yellow": np.array([255, 255, 128]),
                "Light Blue": np.array([128, 128, 255]),
                "Light Magenta": np.array([255, 128, 255]),
                "Light Cyan": np.array([128, 255, 255]),
                "White": np.array([255, 255, 255])
                }
target_colors = {
                "Black": np.array([59, 66, 82]),
                "Red": np.array([191, 97, 106]), 
                "Green": np.array([160, 190, 140]), 
                "Brown/Yellow": np.array([235, 203, 139]),
                "Blue": np.array([129, 161, 193]),
                "Magenta": np.array([180, 140, 170]),
                "Cyan": np.array([136, 192, 208]),
                "Light Grey": np.array([229, 233, 240]),
                "Dark Grey": np.array([76, 86, 106]),
                "Light Red": np.array([191, 97, 106]),
                "Light Green": np.array([163, 190, 140]),
                "Yellow": np.array([235, 203, 139]),
                "Light Blue": np.array([129, 161, 193]),
                "Light Magenta": np.array([180, 142, 173]),
                "Light Cyan": np.array([143, 188, 187]),
                "White": np.array([236, 239, 244])
                }

# Utility functions
def hex2rgb(hex): 
    hex = hex.lstrip('#') 
    hlen = len(hex) 
    return tuple(int(hex[i:i+hlen//3], 16) for i in range(0, hlen, hlen//3)) 

def rgb2hex(a):
    # Python is so pretty
    r, g, b = a.tolist()
    return '#{:02x}{:02x}{:02x}'.format(r, g, b)

def draw_palette(colors):
    PALETTE_TILE = 20
    new_image = Image.new('RGB', ((int(len(colors)//2*PALETTE_TILE)), 2*PALETTE_TILE));
    draw = ImageDraw.Draw(new_image);
    height = 0
    for index in range(len(colors)):
        if(index>7):
            height = 20
        x0 = (PALETTE_TILE * (index%8))
        y0 = 0+height
        x1 = (PALETTE_TILE * ((index%8)+1))
        y1 = PALETTE_TILE+height
        draw.rectangle([(x0, y0), (x1, y1)], fill=colors[index]);

    new_image.save('palette.png', "PNG");

def improve_contrast(color, ideal, m, t):
    color = hex2rgb(color)
    r0, g0, b0 = ideal.tolist()
    r0 = r0/m
    g0 = g0/m
    b0 = b0/m
    r1, g1, b1 = color
    r1 = r1/t
    g1 = g1/t
    b1 = b1/t
    r = int(((r0+r1)/2)*255)
    g = int(((g0+g1)/2)*255)
    b = int(((b0+b1)/2)*255)
    return rgb2hex(np.array([r, g, b]))
    

def get_color_distance(target, color):
    return np.linalg.norm(target - color)

def plot_vector(a, b):
    a1 = [0,0,0]
    a1.extend(a.tolist())
    a = np.array(a1)
    b1 = [0,0,0]
    b1.extend(b.tolist())
    b = np.array(b1)

    soa = np.array([a,b])
    
    X, Y, Z, U, V, W = zip(*soa)
    fig = plt.figure()
    ax = fig.add_subplot(111, projection='3d')
    ax.quiver(X, Y, Z, U, V, W)
    ax.set_xlim([0, 255])
    ax.set_ylim([0, 255])
    ax.set_zlim([0, 255])
    plt.show()


def get_closest_color(target, colors, m=0.8, t=0.2):
    """
        target: the ideal color we want to have for our theme
        colors: the extracted palette from the picture
        wanted_distance: the maximum distance to the ideal vector
        m: the weight of the best match when mixing colors
        t: the weight of the target color when mixing
    """
    # Initialize match as first color in palette
    match = colors[0]
    # Initialize distance with distance from first color to ideal value
    best_distance = get_color_distance(target, match)
    for color in colors[1::]:
        distance = get_color_distance(target, color)
        if(distance < best_distance):
            best_distance = distance
            match = color
    # Convert match from Numpy.Array to list type
    match = match.tolist()
    # Improve readability of code by naming vars properly
    m_percentage = m
    t_percentage = t
    match = [
            int((m_percentage*match[0]+t_percentage*target[0])//2),
            int((m_percentage*match[1]+t_percentage*target[1])//2),
            int((m_percentage*match[2]+t_percentage*target[2])//2)
            ]
    # Convert match back to Numpy.Array
    match = np.array(match)
    #plot_vector(match, np.array(target))
    match = rgb2hex(match)
    return match

def get_palette(colors, ideal):
    """
    For a list of colors and a target list,
    match pairs. E.g. find color closest to black, closest to green, to blue...
    """
    palette_values = list([])
    t = target_colors.values()
    for i, target in enumerate(t):
        # For first 8 base colors, only take good matches,
        # if the match is too off return a new color with 40% match-colors
        # and 60% ideal-colors
        if(i==0):
            color = get_closest_color(target, colors, m=0.8, t=0.2)
        if(0<i and i<=8):
            color = get_closest_color(target, colors, m=0.9, t=0.1)
            color = improve_contrast(color, ideal[i], m=340, t=170)
        # For last 8 accent colors, accept more matches and recalculate soft
        # If there is no color close to what we want (distance over third argument)
        if(i>8):
            color = get_closest_color(target, colors, m=0.9, t=0.1)
            color = improve_contrast(color, ideal[i], m=380, t=130)
        palette_values.append(color)
    draw_palette(palette_values)
    return palette_values

def get_xfce4_configuration(colors):
    configuration_strings = list([])
    ideal = list(ideal_colors.values())
    colors = get_palette(colors, ideal)
    configuration_strings.append("ColorPalette="+";".join(str(i) for i in colors))
    configuration_strings.append("ColorForeground="+colors[7])
    p = improve_contrast(colors[12], ideal[0], m=500, t=550)
    print(p)
    configuration_strings.append("ColorBackground="+p)
    configuration_strings.append("ColorCursor="+colors[9])
    configuration_strings.append("ColorBold="+colors[14])
    return configuration_strings

def get_colors(infile, numcolors=16, swatchsize=20, resize=400):

    image = Image.open(infile)
    image = image.resize(tuple((resize, resize)))
    result = image.convert('P', dither="NONE", palette=Image.ADAPTIVE, colors=numcolors)
    # Bit ugly tbh,
    # getpalette() returns a list with (numcolors * 3 elements)
    # 
    l = result.getpalette()
    l = l[:48]
    resultColors = list()
    for i in range(0, len(l)):
        if(i % 3 == 0 and i+2<=len(l)):
            resultColors.append(np.array([l[i],l[i+1],l[i+2]]))
    
    with open('/home/arons/.config/i3/colors', 'w') as f:
        ideal = list(ideal_colors.values())
        for i, color in enumerate(get_palette(resultColors, ideal)):
            line = "set $base" + format((i-10*(-1)), '02X') + " " + color + "\n"
            f.write(line)
    with open('/home/arons/.config/xfce4/terminal/colors', 'w') as f:
        for line in get_xfce4_configuration(resultColors):
            f.write(line+"\n")

if __name__ == '__main__':
    get_colors(sys.argv[1])
