# Dracula color definitions
# Taken from https://draculatheme.com/contribute
# If you're seeing this from a repo hosted on draculatheme.com, hello! Thanks for taking the time to check out my work!
# If you're editing this to change up the colors (don't worry, I won't take it personally!), here are some recommendations
# that I have from my own testing:
#   * `Background` seems to be better than `Foreground` when coloring text atop backgrounds of Purple, Cyan, Green, and Yellow
Background      = (40, 42, 54)	
Current_Line    = (68, 71, 90)	
Foreground      = (248, 248, 242)	
Comment	        = (98, 114, 164)	
Cyan            = (139, 233, 253)	
Green           = (80, 250, 123)	
Orange          = (255, 184, 108)	
Pink            = (255, 121, 198)	
Purple          = (189, 147, 249)	
Red             = (255, 85, 85)	
Yellow          = (241, 250, 140)

class DefaultColor(object):
    """
    This class should have the default colors for every segment.
    Please test every new segment with this theme first.
    """
    # RESET is not a real color code. It is used as in indicator
    # within the code that any foreground / background color should
    # be cleared
    RESET = -1

    USERNAME_FG = 250
    USERNAME_BG = 240
    USERNAME_ROOT_BG = 124

    HOSTNAME_FG = 250
    HOSTNAME_BG = 238

    HOME_SPECIAL_DISPLAY = True
    HOME_BG = 31  # blueish
    HOME_FG = 15  # white
    PATH_BG = 237  # dark grey
    PATH_FG = 250  # light grey
    CWD_FG = 254  # nearly-white grey
    SEPARATOR_FG = 244

    READONLY_BG = 124
    READONLY_FG = 254

    SSH_BG = 166  # medium orange
    SSH_FG = 254

    REPO_CLEAN_BG = 148  # a light green color
    REPO_CLEAN_FG = 0  # black
    REPO_DIRTY_BG = 161  # pink/red
    REPO_DIRTY_FG = 15  # white

    JOBS_FG = 39
    JOBS_BG = 238

    CMD_PASSED_BG = 236
    CMD_PASSED_FG = 15
    CMD_FAILED_BG = 161
    CMD_FAILED_FG = 15

    SVN_CHANGES_BG = 148
    SVN_CHANGES_FG = 22  # dark green

    GIT_AHEAD_BG = 240
    GIT_AHEAD_FG = 250
    GIT_BEHIND_BG = 240
    GIT_BEHIND_FG = 250
    GIT_STAGED_BG = 22
    GIT_STAGED_FG = 15
    GIT_NOTSTAGED_BG = 130
    GIT_NOTSTAGED_FG = 15
    GIT_UNTRACKED_BG = 52
    GIT_UNTRACKED_FG = 15
    GIT_CONFLICTED_BG = 9
    GIT_CONFLICTED_FG = 15

    GIT_STASH_BG = 221
    GIT_STASH_FG = 0

    VIRTUAL_ENV_BG = 35  # a mid-tone green
    VIRTUAL_ENV_FG = 00

    BATTERY_NORMAL_BG = 22
    BATTERY_NORMAL_FG = 7
    BATTERY_LOW_BG = 196
    BATTERY_LOW_FG = 7

    AWS_PROFILE_FG = 39
    AWS_PROFILE_BG = 238

    TIME_FG = 250
    TIME_BG = 238

# --- Change Dracula Theme colors in this class! ---
class Color(DefaultColor):
    """
    This subclass is required when the user chooses to use 'default' theme.
    Because the segments require a 'Color' class for every theme.
    """

    USERNAME_FG = Background
    USERNAME_BG = Purple
    USERNAME_ROOT_BG = Purple

    HOSTNAME_FG = Background 
    HOSTNAME_BG = Purple

    READONLY_BG = Background 
    READONLY_FG = Red

    HOME_SPECIAL_DISPLAY = False
    PATH_BG = Background  # dark grey
    PATH_FG = Comment  # light grey
    CWD_FG = Foreground  # white
    SEPARATOR_FG = Current_Line 

    REPO_CLEAN_BG = Green  
    REPO_CLEAN_FG = Background
    REPO_DIRTY_BG = Red 
    REPO_DIRTY_FG = Background 

    CMD_PASSED_BG = Current_Line
    CMD_PASSED_FG = Foreground 
    CMD_FAILED_BG = Red 
    CMD_FAILED_FG = Background

    GIT_AHEAD_BG = Background
    GIT_AHEAD_FG = Green
    GIT_BEHIND_BG = Background
    GIT_BEHIND_FG = Orange
    GIT_STAGED_BG = Background
    GIT_STAGED_FG = Green
    GIT_NOTSTAGED_BG = Background
    GIT_NOTSTAGED_FG = Orange
    GIT_UNTRACKED_BG = Background
    GIT_UNTRACKED_FG = Purple
    GIT_CONFLICTED_BG = Red
    GIT_CONFLICTED_FG = Foreground

    GIT_STASH_BG = Orange
    GIT_STASH_FG = Background

    VIRTUAL_ENV_BG = Background
    VIRTUAL_ENV_FG = Cyan

    BATTERY_NORMAL_BG = Background
    BATTERY_NORMAL_FG = Green
    BATTERY_LOW_BG = Background 
    BATTERY_LOW_FG = Red

    TIME_FG = Purple 
    TIME_BG = Background


