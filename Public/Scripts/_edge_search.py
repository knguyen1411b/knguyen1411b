'''
Tự động tìm kiếm trên Microsoft Edge bằng các từ ngẫu nhiên.

Cài đặt các thư viện cần thiết:
pip install pyautogui keyboard wonderwords

Cách sử dụng
python _edge_search.py
- Mở file script bằng CMD hoặc PowerShell, chuyển sang cửa sổ Edge, nhấn **F1** để bắt đầu tìm kiếm tự động.

Dừng chương trình
- Giữ **F1** cho đến khi xuất hiện một tab mới → báo hiệu script đã dừng.  
- Nếu không dừng được, hãy thử chờ script chạy hết, hoặc đóng CMD/PowerShell thủ công.  

Lưu ý: Hãy mở sẵn Microsoft Edge với profile bạn muốn trước khi chạy script.
'''

'''
Automates searches in Microsoft Edge using random words.

Install dependencies with:
pip install pyautogui keyboard wonderwords

How to use:
python _edge_search.py
- Once the CMD window opens, switch to your browser and press F1. The script will begin searching automatically.
Stopping the Program:
- Hold F1 until a new tab opens—this indicates the program has stopped.
- If this does not work, wait for it to finish or close the CMD window manually.

Make sure to have Edge open with the desired profile when running the script.
'''

import pyautogui
import time
import random
import keyboard
import sys
import wonderwords


class EdgeAutoSearch:
    def __init__(self, repeats=50, min_delay=5, max_delay=8, mode_sentence=False):
        """
        Initialize the auto-search bot.
        :param repeats: number of searches to perform
        :param min_delay: minimum delay (in seconds) between searches
        :param max_delay: maximum delay (in seconds) between searches
        :param mode_sentence: if True, generate random sentences; otherwise random words
        """
        self.running = False              # Whether the script is running
        self.debouncerun = True           # Debounce for step execution
        self.key_debounce = True          # Debounce for F1 key press
        self.repeats = repeats            # Number of search iterations
        self.min_delay = min_delay        # Minimum wait time
        self.max_delay = max_delay        # Maximum wait time
        self.mode_sentence = mode_sentence
        # Choose generator: RandomSentence if mode_sentence=True, else RandomWord
        self.rw = wonderwords.RandomSentence() if self.mode_sentence else wonderwords.RandomWord()

    def generate_random_word(self):
        """ Generate a random word or sentence depending on the mode. """
        return self.rw.sentence() if self.mode_sentence else self.rw.word()

    def search_edge(self, repeats, custom=None):
        """
        Trigger a search in Microsoft Edge.
        - If custom is provided, search for that string.
        - Otherwise generate a random word/sentence + append repeat number.
        """
        pyautogui.hotkey('ctrl', 'e')  # Focus search bar (Ctrl+E in Edge)
        if custom:
            pyautogui.typewrite(str(custom))
        else:
            random_text = self.generate_random_word()
            pyautogui.typewrite(random_text + ' ' + str(repeats))
        time.sleep(0.1)
        pyautogui.press('enter')  # Submit the search

    def step(self):
        """ Perform a single search step if still within repeat count. """
        if self.debouncerun and self.repeats >= 0:
            self.debouncerun = not self.debouncerun
            self.search_edge(self.repeats, custom=0)
            time.sleep(random.uniform(self.min_delay, self.max_delay))  # Random delay between searches
            self.repeats -= 1
            self.debouncerun = not self.debouncerun
        elif self.repeats < 0:
            self.search_edge(0, "Script finished")
            print("Script finished")
            sys.exit(0)

    def toggle_running(self):
        """ Toggle the running state when F1 is pressed. """
        self.running = not self.running
        self.key_debounce = not self.key_debounce

        if self.running:
            print("Script started")
            self.search_edge(0, "Script started")
        else:
            print("Script stopped")
            self.search_edge(0, "Script stopped")
            time.sleep(2)

        time.sleep(0.1)
        self.key_debounce = not self.key_debounce

    def run(self):
        """
        Main loop:
        - Press F1 to start/stop automation.
        - Press Ctrl+C in the terminal to exit.
        """
        print("Press F1 to start/stop. Press Ctrl+C to exit.")
        try:
            while True:
                try:
                    if keyboard.is_pressed('F1') and self.key_debounce:
                        self.toggle_running()
                except Exception:
                    pass
                if self.running:
                    self.step()
        except KeyboardInterrupt:
            print("Exiting...")
            sys.exit(0)


if __name__ == "__main__":
    """ Configurable settings for the bot """
    _search_config = {
        'repeats': 50,          # number of searches
        'min_delay': 5,         # min delay between searches (seconds)
        'max_delay': 8,         # max delay between searches (seconds)
        'mode_sentence': False  # False = single words, True = full sentences
    }
    edge_auto_search = EdgeAutoSearch(**_search_config)
    edge_auto_search.run()