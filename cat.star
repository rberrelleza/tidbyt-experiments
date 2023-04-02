load("encoding/base64.star", "base64")
load("random.star", "random")
load("render.star", "render")

CAT_IMAGE = base64.decode("""
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
""")

messages = [
    "Hetchy says meow!",
    "Time to give me a treat",
    "Hi, I'm Hetch Hetchy the Cat",
    "On your feet, it's play time!",
    "Don't forget to brush your teet"
]

def get_message():
    random_index = random.number(0, len(messages) - 1)
    return  messages[random_index]

def main():
    return render.Root(
        child = render.Column(
            cross_align = "center", 
            children = [
                render.Marquee(
                    offset_start = 30,
                    align = "center",
                    width = 64,
                    child = render.Text(get_message(), color="#FDDA0D"),
                ),
                render.Image(src = CAT_IMAGE)
            ],
        )
     )