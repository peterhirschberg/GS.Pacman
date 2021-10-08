/*
 * main.c
 * GS.Asteroids
 *
 * Created by Peter Hirschberg on 5/14/21.
 * Copyright (c) 2021 Peter Hirschberg. All rights reserved.
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#include <gsos.h>
#include <Memory.h>
#include <Locator.h>
#include <MiscTool.h>
#include <Resources.h>
#include <Sound.h>
#include <QuickDraw.h>

#include "main.h"

// Macro is from BuGS - copyright Jeremy Rand. https://github.com/jeremysrand/BuGS
#define TOOLFAIL(string) \
    if (toolerror()) SysFailMgr(toolerror(), "\p" string "\n\r    Error Code -> $");


unsigned int userid;
unsigned int randomSeed;



word getRandom(range)
{
    return rand() % range;
}

word getRandomRange(word lower, word upper)
{
    int range = upper - lower;
    return (rand() % range) + lower;
}


// Sounds

static void loadSound(Word addr, Word soundNum)
{
    Handle handle = LoadResource(rRawSound, soundNum);
    HLock(handle);
    WriteRamBlock(*handle, addr, GetHandleSize(handle));
    HUnlock(handle);
}

void loadIntroSound(word addr)
{
    loadSound(addr, INTRO_SOUND);
}

void loadInterSound(word addr)
{
    loadSound(addr, INTER_SOUND);
}

void loadSiren1Sound(word addr)
{
    loadSound(addr, SIREN1_SOUND);
}

void loadSiren2Sound(word addr)
{
    loadSound(addr, SIREN2_SOUND);
}

void loadEatDotSound(word addr)
{
    loadSound(addr, EATDOT_SOUND);
}

void loadExtraLifeSound(word addr)
{
    loadSound(addr, EXTRALIFE_SOUND);
}

void loadFruitSound(word addr)
{
    loadSound(addr, FRUIT_SOUND);
}

void loadGhostScaredSound(word addr)
{
    loadSound(addr, GHOSTSCARED_SOUND);
}

void loadEatGhostSound(word addr)
{
    loadSound(addr, EATGHOST_SOUND);
}

void loadDeathSound(word addr)
{
    loadSound(addr, DEATH_SOUND);
}

void preloadSound(void)
{
    LoadResource(rRawSound, INTRO_SOUND);
    LoadResource(rRawSound, INTER_SOUND);
    LoadResource(rRawSound, SIREN1_SOUND);
    LoadResource(rRawSound, SIREN2_SOUND);
    LoadResource(rRawSound, EATDOT_SOUND);
    LoadResource(rRawSound, EXTRALIFE_SOUND);
    LoadResource(rRawSound, FRUIT_SOUND);
    LoadResource(rRawSound, GHOSTSCARED_SOUND);
    LoadResource(rRawSound, EATGHOST_SOUND);
    LoadResource(rRawSound, DEATH_SOUND);
}

int main(void)
{
    int event;
    Ref toolStartupRef;
    
    userid = MMStartUp();
    TLStartUp();
    toolStartupRef = StartUpTools(userid, refIsResource, TOOL_STARTUP);
//    CompactMem();
    
//    NewHandle((LongWord)0x8000, userid, (Word)(attrLocked | attrFixed | attrAddr | attrBank), (Pointer)0x1c0000);
//    TOOLFAIL("Unable to allocate maze buffer");
    
    InitMouse(0);
    SetMouse(transparent);
    
    randomSeed = (int)time(NULL);
    if (randomSeed == 0)
        randomSeed = 1;
    srand(randomSeed);
    
    preloadSound();
    
    baseInit();
    
    runGameTick();
    
    ShutDownTools(refIsHandle, toolStartupRef);
    TLShutDown();
    MMShutDown(userid);
    
    return 0;
}
