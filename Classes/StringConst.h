//
//  StringConst.h
//  ZombieGame
//
//  Created by David Guinnip on 6/16/10.
//  Copyright 2010 Kaselo. All rights reserved.
//
#import <UIKit/UIKit.h>

#ifndef STRINGCONST
#define STRINGCONST

static const char WEBISTE_URL []					= "http://www.kaselo.com";

#ifdef DOGHOUSE
static const char COMBO_NAME []						= "Dog Combos";
static const char GAME_MODE_1_SCORE []				= "Dog House Classic Score!";
static const char GAME_HIGH_SCORE []				= "Dog House New High Score!";
static const char GAME_MODE_2_HIGH_SCORE []			= "Dog House Barking Mad High Score!";
static const char GAME_MODE_1_FIRST_PLACE []		= "Earned a Steak on Level";
static const char GAME_MODE_1_SECOND_PLACE []		= "Earned a Bone on Level";
static const char GAME_MODE_1_THIRD_PLACE []		= "Earned a Stick on Level";
static const char APP_NAME []						= "Dog House";
static const char IMG_BRONZESKULL []				= "http://emmaguinnip.com/Graphics/EndGameClassic03.png";
static const char IMG_SILVERSKULL []				= "http://emmaguinnip.com/Graphics/EndGameClassic02.png";
static const char IMG_GOLDSKULL	[]					= "http://emmaguinnip.com/Graphics/EndGameClassic01.png";
#else
static const char COMBO_NAME []						= "Zombie Comboz";
static const char GAME_MODE_1_SCORE []				= "Zombie House Crawler Score!";
static const char GAME_HIGH_SCORE []				= "Zombie House New High Score!";
static const char GAME_MODE_2_HIGH_SCORE []			= "Zombie House Berzerker High Score!";
static const char GAME_MODE_1_FIRST_PLACE []		= "Earned a Golden Skull on Level";
static const char GAME_MODE_1_SECOND_PLACE []		= "Earned a Silver Skull on Level";
static const char GAME_MODE_1_THIRD_PLACE []		= "Earned a Bronze Skull on Level";
static const char APP_NAME []						= "Zombie House";
static const char IMG_BRONZESKULL []				= "http://emmaguinnip.com/Graphics/Z_EndGameClassic03.png";
static const char IMG_SILVERSKULL []				= "http://emmaguinnip.com/Graphics/Z_EndGameClassic02.png";
static const char IMG_GOLDSKULL	[]					= "http://emmaguinnip.com/Graphics/Z_EndGameClassic01.png";

#endif


#ifdef DOGHOUSE
#ifdef IPAD
#else
static const char	IMG_ALLBAD []				= "allBad.png";
static const char	IMG_ALLGOOD []				= "allGood.png";
static const char	IMG_BG_CLASSICA []			= "bg_EndGame_win.jpg";
static const char	IMG_BG_CLASSICB []			= "bg_EndGame_win.jpg";
static const char	IMG_BG_CLASSICC []			= "bg_EndGame_lose.jpg";
static const char   IMG_BG_CLASSIC_WIN[]		= "bg_endgame_win.jpg";
static const char   IMG_BG_CLASSIC_LOSE[]		= "bg_endgame_lose.jpg";
static const char	IMG_BG_ENDGAMEB_WIN []		= "bg_EndGameB_win.jpg";
static const char	IMG_BG_ENDGAMEB_LOSE []		= "bg_EndGameB_lose.jpg";
static const char	IMG_BG_GAMEPLAY []			= "bg_GamePlay.jpg";
static const char	IMG_BRAIN1 []				= "brain_1.png";
static const char	IMG_BRAIN2 []				= "brain_2.png";
static const char	IMG_BRAIN3 []				= "brain_3.png";
static const char	IMG_ENDGAME_GUN[]			= "EndGame_Gun.png";
static const char	IMG_PAUSE_OFF []			= "b_Pause_off.png";
static const char	IMG_PAUSE_ON []				= "b_Pause_on.png";
static const char	IMG_FX_ON []				= "b_FX_on.png";
static const char	IMG_FX_OFF []				= "b_FX_off.png";
static const char	IMG_HINTS_ON []				= "b_Hints_on.png";
static const char	IMG_HINTS_OFF []			= "b_Hints_off.png";
static const char	IMG_SLIDER_BALL []			= "slider_eyeball.png";
static const char   IMG_PIECE_A		[]			= "%d%d%d0a.png";
static const char   IMG_PIECE_B		[]			= "%d%d%d0b.png";
static const char	IMG_BRAINS		[]			= "brains_%d.png";
static const char	SND_NONGAME_TRACK	[]		= "%@/Audio_BG02.mp3";
static const char	SND_CRAWLER_TRACK	[]		= "%@/Audio_BG01.mp3";
static const char	SND_BERZERK_TRACK	[]		= "%@/Audio_BG03.mp3";

static const char	SND_BRAIN_PUMP	[]			= "/waterhit.wav";
static const char	SND_WRONG	[]				= "/wrong.wav";
static const char	SND_CORRECT	[]				= "/correct.wav";
static const char	SND_SCREAM	[]				= "/Pickles.wav";
static const char	SND_SHOTGUN	[]				= "/Pickles.wav";
static const char	SND_GAME_START	[]			= "/Game_Start_faster.wav";
static const char	SND_BRAIN_EXPLODE	[]		= "/watersplash.wav";
static const char   SND_MEOW 		[]		= "/Pickles.wav";
static const char	SND_ZOMBIE_EXP_1	[]		= "/%d%d.wav";
static const char	SND_ZOMBIE_EXP_2	[]		= "/%d6.wav";
static const char	SND_ZOMBIE_EXP_3	[]		= "/%d7.wav";
static const char	SND_ZOMBIE_EXP_4	[]		= "/%d8.wav";
static const char	SND_ZOMBIE_EXP_5	[]		= "/%d9.wav";
static const char	SND_EATING			[]		= "%@/zombiesEating.mp3";
static const char	SND_WATERSPLASH		[]		= "@watersplash.wav";
static const char   SND_WATERHIT		[]		= "@watersplash.wav";
#endif // IPAD
#else
#ifdef IPAD
static const char	IMG_ALLBAD []				= "ipad_allBad.png";
static const char	IMG_ALLGOOD []				= "ipad_allGood.png";
static const char	IMG_BG_CLASSICA []			= "ipad_bg_EndGameClassicA.jpg";
static const char	IMG_BG_CLASSICB []			= "ipad_bg_EndGameClassicB.jpg";
static const char	IMG_BG_CLASSICC []			= "ipad_bg_EndGameClassicC.jpg";
static const char	IMG_BG_ENDGAMEB_WIN []		= "ipad_bg_EndGameB_win.jpg";
static const char	IMG_BG_ENDGAMEB_LOSE []		= "ipad_bg_EndGameB_lose.jpg";
static const char	IMG_BG_GAMEPLAY []			= "ipad_bg_GamePlay.jpg";
static const char	IMG_BRAIN1 []				= "ipad_brain_1.png";
static const char	IMG_BRAIN2 []				= "ipad_brain_2.png";
static const char	IMG_BRAIN3 []				= "ipad_brain_3.png";
static const char	IMG_ENDGAME_GUN[]			= "ipad_EndGame_Gun.png";
static const char	IMG_PAUSE_OFF []			= "ipad_b_Pause_off.png";
static const char	IMG_PAUSE_ON []				= "ipad_b_Pause_on.png";
static const char	IMG_FX_ON []				= "ipad_b_FX_on.png";
static const char	IMG_FX_OFF []				= "ipad_b_FX_off.png";
static const char	IMG_HINTS_ON []				= "ipad_b_Hints_on.png";
static const char	IMG_HINTS_OFF []			= "ipad_b_Hints_off.png";
static const char	IMG_SLIDER_BALL []			= "ipad_slider_eyeball.png";
static const char   IMG_PIECE_A		[]			= "ipad_%d%d%d0a.png";
static const char   IMG_PIECE_B		[]			= "ipad_%d%d%d0b.png";
static const char	IMG_BRAINS		[]			= "ipad_brains_%d.png";
static const char	SND_NONGAME_TRACK	[]		= "%@/ipad_Audio_BG02.mp3";
static const char	SND_CRAWLER_TRACK	[]		= "%@/ipad_Audio_BG01.mp3";
static const char	SND_BERZERK_TRACK	[]		= "%@/ipad_Audio_BG03.mp3";

static const char	SND_BRAIN_PUMP	[]			= "/ipad_brainPump.wav";
static const char	SND_WRONG	[]				= "/ipad_wrong.wav";
static const char	SND_CORRECT	[]				= "/ipad_correct.wav";
static const char	SND_SCREAM	[]				= "/ipad_wilhelm.wav";
static const char	SND_SHOTGUN	[]				= "/ipad_ShotGun_pumps.wav";
static const char	SND_GAME_START	[]			= "/ipad_Game_Start_faster.wav";
static const char	SND_BRAIN_EXPLODE	[]		= "/ipad_brainExplode.wav";
static const char	SND_ZOMBIE_EXP_1	[]		= "/ipad_%d%d.wav";
static const char	SND_ZOMBIE_EXP_2	[]		= "/ipad_%d6.wav";
static const char	SND_ZOMBIE_EXP_3	[]		= "/ipad_%d7.wav";
static const char	SND_ZOMBIE_EXP_4	[]		= "/ipad_%d8.wav";
static const char	SND_ZOMBIE_EXP_5	[]		= "/ipad_%d9.wav";
static const char	SND_EATING			[]		= "%@/ipad_zombiesEating.mp3";
#else
static const char	IMG_ALLBAD []				= "allBad.png";
static const char	IMG_ALLGOOD []				= "allGood.png";
static const char   IMG_BG_CLASSIC_LEVELS[]		= "bg_LevelsClassic.jpg";
static const char	IMG_BG_CLASSICA []			= "bg_EndGameClassicA.jpg";
static const char	IMG_BG_CLASSICB []			= "bg_EndGameClassicB.jpg";
static const char	IMG_BG_CLASSICC []			= "bg_EndGameClassicC.jpg";
static const char	IMG_BG_ENDGAMEB_WIN []		= "bg_EndGameB_win.jpg";
static const char	IMG_BG_ENDGAMEB_LOSE []		= "bg_EndGameB_lose.jpg";
static const char	IMG_BG_GAMEPLAY []			= "bg_GamePlay.jpg";
static const char	IMG_BRAIN1 []				= "brain_1.png";
static const char	IMG_BRAIN2 []				= "brain_2.png";
static const char	IMG_BRAIN3 []				= "brain_3.png";
static const char	IMG_ENDGAME_GUN[]			= "EndGame_Gun.png";
static const char	IMG_PAUSE_OFF []			= "b_Pause_off.png";
static const char	IMG_PAUSE_ON []				= "b_Pause_on.png";
static const char	IMG_FX_ON []				= "b_FX_on.png";
static const char	IMG_FX_OFF []				= "b_FX_off.png";
static const char	IMG_HINTS_ON []				= "b_Hints_on.png";
static const char	IMG_HINTS_OFF []			= "b_Hints_off.png";
static const char	IMG_SLIDER_BALL []			= "slider_eyeball.png";
static const char   IMG_PIECE_A		[]			= "%d%d%d0a.png";
static const char   IMG_PIECE_B		[]			= "%d%d%d0b.png";
static const char	IMG_BRAINS		[]			= "brains_%d.png";
static const char	SND_NONGAME_TRACK	[]		= "%@/Audio_BG02.mp3";
static const char	SND_CRAWLER_TRACK	[]		= "%@/Audio_BG01.mp3";
static const char	SND_BERZERK_TRACK	[]		= "%@/Audio_BG03.mp3";

static const char	SND_BRAIN_PUMP	[]			= "/brainPump.wav";
static const char	SND_WRONG	[]				= "/wrong.wav";
static const char	SND_CORRECT	[]				= "/correct.wav";
static const char	SND_SCREAM	[]				= "/wilhelm.wav";
static const char	SND_SHOTGUN	[]				= "/ShotGun_pumps.wav";
static const char	SND_GAME_START	[]			= "/Game_Start_faster.wav";
static const char	SND_BRAIN_EXPLODE	[]		= "/brainExplode.wav";
static const char	SND_ZOMBIE_EXP_1	[]		= "/%d%d.wav";
static const char	SND_ZOMBIE_EXP_2	[]		= "/%d6.wav";
static const char	SND_ZOMBIE_EXP_3	[]		= "/%d7.wav";
static const char	SND_ZOMBIE_EXP_4	[]		= "/%d8.wav";
static const char	SND_ZOMBIE_EXP_5	[]		= "/%d9.wav";
static const char	SND_EATING			[]		= "%@/zombiesEating.mp3";
#endif //IPAD



#endif//DOGHOUSE
#endif//STRINGCONST

@interface StringConst : NSObject {


	
}

+(NSString *) GetImgConst:(const char *) c;


@end

