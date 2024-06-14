# 
#  Copyright (c) 2024 王光磊 gwang@embednix.com
#  This work is licensed under the Creative Commons Attribution License. To view a copy of this license,visit
#  http://creativecommons.org/licenses/by/2.5/ or send a letter to Creative Commons, 444 Castro Street, Suite 900, Mountain View, California 94041, USA.
# 
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
#  TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
#  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
#  TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
# 


escape_letters = ['&', '%', '$', '#', '_', '{', '}', '~', '^', '\\']


def escape_line_string(line_string = ""):
    new_line_string = ""
    for char in line_string:
        if char in escape_letters:
            if char == '\\':
                new_line_string += " \\textbackslash "
            else:
                new_line_string += "\\" + char
        else:
            new_line_string += char

    return new_line_string


def generate_space_replacement(space_number = 0):
    if space_number == 0:
        return ""

    space_string=""
    for num in range(space_number):
        if num == 0:
            space_string = "${}$\\ "
        else:
            space_string += "\\ "
    return space_string

def process_input_file():
    file_input  = open('input.txt', 'r')
    all_lines = file_input.readlines()
    file_input.close()

    file_output = open('output.txt','w')
    for line in all_lines:
        leading_space_num = 0
        for char in line:
            if char == " ":
                leading_space_num += 1
                continue
            else:
                break
        line_strip = line.strip()
        new_line = generate_space_replacement(leading_space_num) + escape_line_string(line_strip) + " \\linebreak"
        file_output.write(new_line)
        file_output.write("\n")

    file_output.close()


if __name__ == "__main__":
    process_input_file()