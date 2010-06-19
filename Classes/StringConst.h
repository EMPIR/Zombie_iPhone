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

static const char	IMG_ALLBAD []			= "allBad.png";
static const char	IMG_ALLGOOD []			= "allGood.png";
static const char	IMG_BG_CLASSICA []		= "bg_EndGameClassicA.jpg";
static const char	IMG_BG_CLASSICB []		= "bg_EndGameClassicB.jpg";
static const char	IMG_BG_CLASSICC []		= "bg_EndGameClassicC.jpg";
static const char	IMG_BG_ENDGAMEB_WIN []	= "bg_EndGameB_win.jpg";
static const char	IMG_BG_ENDGAMEB_LOSE []	= "bg_EndGameB_lose.jpg";
static const char	IMG_BG_GAMEPLAY []      = "bg_GamePlay.jpg";
static const char	IMG_BRAIN1 []			= "brain_1.png";
static const char	IMG_BRAIN2 []			= "brain_2.png";
static const char	IMG_BRAIN3 []			= "brain_3.png";
static const char	IMG_ENDGAME_GUN[]		= "EndGame_Gun.png";
static const char	IMG_PAUSE_OFF []		= "b_Pause_off.png";
static const char	IMG_PAUSE_ON []			= "b_Pause_on.png";
static const char	IMG_FX_ON []			= "b_FX_on.png";
static const char	IMG_FX_OFF []			= "b_FX_off.png";
static const char	IMG_HINTS_ON []			= "b_Hints_on.png";
static const char	IMG_HINTS_OFF []		= "b_Hints_off.png";
static const char	IMG_SLIDER_BALL []		= "slider_eyeball.png";
static const char   IMG_PIECE_A		[]		= "%d%d%d0a.png";
static const char   IMG_PIECE_B		[]		= "%d%d%d0b.png";
static const char	IMG_BRAINS		[]		= "brains_%d.png";
static const char	SND_BRAIN_PUMP	[]		= "/brainPump.wav";
static const char	SND_WRONG	[]		= "/wrong.wav";
static const char	SND_CORRECT	[]		= "/correct.wav";
static const char	SND_SCREAM	[]		= "/wilhelm.wav";
static const char	SND_SHOTGUN	[]		= "/ShotGun_pumps.wav";
static const char	SND_GAME_START	[]		= "/Game_Start_faster.wav";
static const char	SND_BRAIN_EXPLODE	[]		= "/brainExplode.wav";
static const char	SND_ZOMBIE_EXP_1	[]		= "/%d%d.wav";
static const char	SND_ZOMBIE_EXP_2	[]		= "/%d6.wav";
static const char	SND_ZOMBIE_EXP_3	[]		= "/%d7.wav";
static const char	SND_ZOMBIE_EXP_4	[]		= "/%d8.wav";
static const char	SND_ZOMBIE_EXP_5	[]		= "/%d9.wav";
#endif

@interface StringConst : NSObject {


	
}

+(NSString *) GetImgConst:(const char *) c;


@end

