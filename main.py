import vk_api
from vk_api.longpoll import VkLongPoll, VkEventType
from vk_api.keyboard import VkKeyboard, VkKeyboardColor

session = vk_api.VkApi(
    token="vk1.a.mJ8ZxrhH9OWe79XnV8uZIvVg0iR35JT5Ksomu16cprgwI9ra5ydOGp24ecxS1u_BgzzZs2mRoqWqVB2gBkBk57JKVEVl_rfnbwVkVhnxwDKMwCFadbNKYv5FA1X47iAYMUaA6HmhLL7BeXA-EMqgaH8UB3pG2lJzAP3cAunFnhkShl5yRO8LtPUDfDc8kiA0Xtazg2skZN6Taqx8MM2Z2Q")


def send_message(user_id, message, keyboard=None):
    post = {
        "user_id": user_id,
        "message": message,
        "random_id": 0,
    }

    if keyboard is not None:
        post["keyboard"] = keyboard.get_keyboard()

    session.method("messages.send", post)


for event in VkLongPoll(session).listen():
    if event.type == VkEventType.MESSAGE_NEW and event.to_me:
        text = event.text.lower()
        user_id = event.user_id,

        if text == "start":
            keybord = VkKeyboard()
            keybord.add_location_button()
            keybord.add_line()
            buttons = ["blue", "red", "white", "green"]
            button_colors = [VkKeyboardColor.PRIMARY, VkKeyboardColor.NEGATIVE, VkKeyboardColor.SECONDARY,
                             VkKeyboardColor.POSITIVE]

            for btn, btn_color in zip(buttons, button_colors):
                keybord.add_button(btn, btn_color)

            # keybord.add_openlink_button("Map", "https://vk-api.readthedocs.io/en/latest/index.html") кнопка с ссылкой

            send_message(user_id, "The first button", keybord)
