	
//////////////////////////////////////
//	
// 	Particle-Effects 
//	Instance-Definitions 
//	
//////////////////////////////////////


// INSTANCE PartikelEffekt1 (C_ParticleFX) 
// INSTANCE PartikelEffekt1 (C_ParticleFXProto) 

///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  I N V I S I B L E    P R O J E C T I L E   XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE MFX_INVISIBLEPROJECTILE	(C_PARTICLEFX)
{
     ppsvalue = 10.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 -100";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "7";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.003000000;
     velvar = 0.001000000;
     lsppartavg = 150.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 200 150";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "2 2";
     vissizeendscale = 8.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 0.000000000;
};


// =================================================================================================
// =================================================================================================
// =========     A D D O N   S P E L L S                                              ==============
// =================================================================================================
// =================================================================================================


///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  B E L I A R  B A L L           XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE MFX_ENERGYBALL_INIT (C_PARTICLEFX)
{
     ppsvalue = 10;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelev = -90;
     velavg = 0.00100000005;
     lsppartavg = 800;
     lsppartvar = 300;
     flygravity_s = "0 -0.0000001 0";
     visname_s = "KOPFBALL2.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 128 128";
     vistexcolorend_s = "255 128 128";
     vissizestart_s = "10 10";
     vissizeendscale = 10;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     useemittersfor = 1;
};

INSTANCE MFX_ENERGYBALL_CAST (C_PARTICLEFX)
{
     ppsvalue = 50;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelev = -90;
     velavg = 0.00100000005;
     lsppartavg = 800;
     lsppartvar = 300;
     flygravity_s = "0 -0.0000001 0";
     visname_s = "KOPFBALL2.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 128 128";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "30 30";
     vissizeendscale = 10;
     visalphafunc_s = "ADD";
     visalphastart = 255;
};


INSTANCE MFX_ENERGYBALL_TARGET (C_PARTICLEFX)
{
     ppsvalue = 3;
     ppsscalekeys_s = "10 9 8 7 6 5 4 3 2 1";
     ppsissmooth = 1;
     ppsfps = 4;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelev = -90;
     velavg = 0.00100000005;
     lsppartavg = 800;
     lsppartvar = 300;
     flygravity_s = "0 -0.0000001 0";
     visname_s = "KOPFBALL2.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 128 128";
     vistexcolorend_s = "255 128 128";
     vissizestart_s = "30 30";
     vissizeendscale = 20;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     useemittersfor = 1;
};

///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  T H U N D E R S T O R M        XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX


INSTANCE MFX_THUNDERSTORM_INIT (C_PARTICLEFX)
{
     ppsvalue = 50.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 20 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "5";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 40.000000000;
     dirangleelev = -89.000000000;
     velavg = 0.000100000;
     lsppartavg = 100.000000000;
     lsppartvar = 0.000000000;
     flygravity_s = "0 -0.003 0";
     visname_s = "STORM_ICE.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "5 8";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

INSTANCE MFX_THUNDERSTORM_INVESTGLOW (C_PARTICLEFX)
{
     ppsvalue = 100;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1;
     shptype_s = "BOX";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "100 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "10 1000 10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleelev = -89;
     velavg = 0.00100000005;
     lsppartavg = 800;
     lsppartvar = 100;
     flygravity_s = "0 0.001 0";
     visname_s = "BELIARSRAGE_CLOUD.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "5 50";
     vissizeendscale = 10;
     visalphafunc_s = "BLEND";
     visalphastart = 255;
};



INSTANCE MFX_THUNDERSTORM_RAIN (C_PARTICLEFX)
{
     ppsvalue = 1500;
     ppsscalekeys_s = "1 1 1 1 1 0.8 0.7 0.6 0.5 0.4 0.3 0.2 0.1";
     ppsfps = 1;
     ppscreateem_s = "MFX_THUNDERSTORM_ICE";
     shptype_s = "BOX";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 500 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "1000 10 1000";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscalefps = 15;
     dirmode_s = "DIR";
     dirfor_s = "WORLD";
     diranglehead = 10;
     dirangleheadvar = 5;
     dirangleelev = -90;
     dirangleelevvar = 5;
     velavg = 1;
     velvar = 0.300000012;
     lsppartavg = 600;
     flygravity_s = "0 0 0";
     visname_s = "SKYRAIN.TGA";
     visorientation_s = "NONE";
     vistexanifps = 10;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 50";
     vissizeendscale = 1;
     visalphafunc_s = "BLEND";
     visalphastart = 255;
     visalphaend = 100;
     trltexture_s = "SIMPLEGLOW.TGA";
     flockmode = "WIND";
};

INSTANCE MFX_THUNDERSTORM_ICE (C_PARTICLEFX)
{
     ppsvalue = 100;
     ppsscalekeys_s = "1 1 1 1 1 0.8 0.7 0.6 0.5 0.4 0.3 0.2 0.1";
     ppsfps = 1;
     shptype_s = "BOX";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 1400 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "2000 10 2000";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscalefps = 15;
     dirmode_s = "DIR";
     dirfor_s = "WORLD";
     diranglehead = 10;
     dirangleheadvar = 5;
     dirangleelev = -90;
     dirangleelevvar = 5;
     velvar = 1;
     lsppartavg = 2000;
     flygravity_s = "0 -0.01 0";
     flycolldet_b = 3;
     visname_s = "STORM_ICE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 10;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "10 18";
     vissizeendscale = 10;
     visalphafunc_s = "BLEND";
     visalphastart = 255;
     visalphaend = 255;
     trlfadespeed = 0.00999999978;
     trltexture_s = "WHITECLOUD.TGA";
     flockmode = "WIND";
};

INSTANCE MFX_THUNDERSTORM_FLASHES (C_PARTICLEFX)
{
     ppsvalue = 12;
     ppsscalekeys_s = "1 1 1 1 1 1 1 1 1 1";
     ppsissmooth = 1;
     ppsfps = 1;
     shptype_s = "BOX";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 3000 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "2000 10 2000";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 5;
     dirmode_s = "DIR";
     dirfor_s = "WORLD";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 20;
     dirangleelev = -90;
     dirangleelevvar = 30;
     velavg = 5;
     velvar = 2;
     lsppartavg = 400;
     flygravity_s = "0 -0.0000001 0";
     visname_s = "THUNDERSTORM_LIGHTNING.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 20;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "120 180";
     vissizeendscale = 20;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     visalphaend = 255;
};

INSTANCE MFX_THUNDERSTORM_DOME (C_PARTICLEFX)
{
     ppsvalue = 200;
     ppsscalekeys_s = "1 1 1 1 1 1 1 1 1 1";
     ppsissmooth = 1;
     ppsfps = 1;
     shptype_s = "MESH";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.000300000014;
     shpisvolume = 1;
     shpdim_s = "1";
     shpmesh_s = "THUNDERSTORM_DOME.3DS";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscalefps = 5;
     dirmode_s = "DIR";
     dirfor_s = "WORLD";
     lsppartavg = 300;
     lsppartvar = 100;
     visname_s = "MFX_SLEEP_STAR.TGA";
     vistexisquadpoly = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "30 30";
     vissizeendscale = 0.100000001;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     visalphaend = 255;
};

///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  S K U L L                      XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX


INSTANCE MFX_SKULL_INIT (C_PARTICLEFX)
{
     ppsvalue = 50;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 5;
     shptype_s = "SPHERE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.000300000014;
     shpisvolume = 1;
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscalefps = 5;
     dirmode_s = "RAND";
     dirfor_s = "WORLD";
     velavg = 0.00999999978;
     lsppartavg = 800;
     lsppartvar = 100;
     visname_s = "BELIARSRAGE_CLOUD.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexaniislooping = 2;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "30 30";
     vissizeendscale = 2;
     visalphafunc_s = "BLEND";
     visalphastart = 255;
};

INSTANCE MFX_SKULL_CAST (C_PARTICLEFX)
{
     ppsvalue = 100;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsfps = 1;
     shptype_s = "MESH";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RANDOM";
     shpdim_s = "7";
     shpmesh_s = "SKULL.3DS";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     diranglehead = -180;
     velavg = 0.0199999996;
     lsppartavg = 3000;
     flygravity_s = "0 0.00005 0";
     visname_s = "BELIARSRAGE_CLOUD.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 15;
     vistexcolorstart_s = "0 0 0";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "10 10";
     vissizeendscale = 6;
     visalphafunc_s = "BLEND";
     visalphastart = 150;
     trltexture_s = "SIMPLEGLOW.TGA";
};



INSTANCE MFX_SKULL_COLLIDE (C_PARTICLEFX)
{
     ppsvalue = 20;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 2;
     shptype_s = "SPHERE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.000300000014;
     shpisvolume = 1;
     shpdim_s = "20";
     shpscalekeys_s = "1";
     shpscalefps = 5;
     dirmode_s = "RAND";
     dirfor_s = "WORLD";
     velavg = 0.00100000005;
     lsppartavg = 800;
     lsppartvar = 100;
     visname_s = "BELIARSRAGE_CLOUD.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexaniislooping = 2;
     vistexcolorstart_s = "255 0 0";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "50 50";
     vissizeendscale = 5;
     visalphafunc_s = "BLEND";
     visalphastart = 255;
};

INSTANCE MFX_SKULL_SPREAD (C_PARTICLEFX)
{
     ppsvalue = 20;
     ppsscalekeys_s = "1 1 2 2 2 3 3 4 4 5";
     ppsissmooth = 6;
     ppsfps = 20;
     shptype_s = "CIRCLE";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "45";
     shpscalekeys_s = "1 2 3 4 5 6 7 8 9 10";
     shpscaleissmooth = 1;
     shpscalefps = 20;
     dirmode_s = "RAND";
     dirfor_s = "object";
     diranglehead = 90;
     dirangleheadvar = 45;
     dirangleelev = 90;
     dirangleelevvar = 45;
     velavg = 0.100000001;
     lsppartavg = 1500;
     lsppartvar = 300;
     flygravity_s = "0 0.00008 0";
     visname_s = "BADWEATH.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 25;
     vistexaniislooping = 2;
     vistexcolorstart_s = "255 0 0";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "20 20";
     vissizeendscale = 20;
     visalphafunc_s = "BLEND";
     visalphastart = 255;
     trltexture_s = "LIGHTNING_BIG_A0.TGA";
};


///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  S U C K   E N E R G Y          XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX



INSTANCE MFX_SUCKENERGY_INIT (C_PARTICLEFX)
{
     ppsvalue = 150;
     ppsislooping = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 2;
     shpdim_s = "80";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 10;
     dirmode_s = "TARGET";
     dirmodetargetfor_s = "OBJECT";
     velavg = 0.100000001;
     lsppartavg = 800;
     flygravity_s = "0 0 0";
     visname_s = "GROUNDFOG.TGA";
     visorientation_s = "VELO";
     vistexanifps = 3;
     vistexcolorstart_s = "255 0 0";
     vistexcolorend_s = "128 0 0";
     vissizestart_s = "30 30";
     vissizeendscale = 0.400000006;
     visalphafunc_s = "BLEND";
     visalphaend = 255;
};

INSTANCE MFX_SUCKENERGY_INVEST (C_PARTICLEFX)
{
     ppsvalue = 150;
     ppsscalekeys_s = "1 2 3 4 5 6 7 8 9 10 10 10 10 10 10 10 10 10 10 10 10 ";
     ppsislooping = 1;
     ppsfps = 3;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 2;
     shpdim_s = "80";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 10;
     dirmode_s = "TARGET";
     dirmodetargetfor_s = "OBJECT";
     velavg = 0.100000001;
     lsppartavg = 800;
     flygravity_s = "0 0 0";
     visname_s = "GROUNDFOG.TGA";
     visorientation_s = "VELO";
     vistexanifps = 3;
     vistexcolorstart_s = "128 0 0";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "30 30";
     vissizeendscale = 0.400000006;
     visalphafunc_s = "BLEND";
     visalphaend = 255;
};


INSTANCE MFX_SUCKENERGY_CAST (C_PARTICLEFX)
{
     ppsvalue = 300;
     ppsscalekeys_s = "10";
     ppsislooping = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 2;
     shpdim_s = "5";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 10;
     dirmode_s = "TARGET";
     dirmodetargetfor_s = "OBJECT";
     velavg = 0.100000001;
     lsppartavg = 400;
     flygravity_s = "0 0 0";
     visname_s = "GROUNDFOG.TGA";
     visorientation_s = "VELO";
     vistexanifps = 3;
     vistexcolorstart_s = "128 0 0";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "30 30";
     vissizeendscale = 0.400000006;
     visalphafunc_s = "BLEND";
     visalphastart = 255;
     visalphaend = 255;
};


INSTANCE MFX_SUCKENERGY_TARGET (C_PARTICLEFX)
{
     ppsvalue = 50;
     ppsscalekeys_s = "1";
     ppsfps = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 2;
     shpdim_s = "5";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 10;
     dirmode_s = "TARGET";
     dirmodetargetfor_s = "OBJECT";
     velavg = 0.100000001;
     lsppartavg = 2000;
     flygravity_s = "0 0 0";
     visname_s = "GROUNDFOG.TGA";
     visorientation_s = "VELO";
     vistexanifps = 3;
     vistexcolorstart_s = "128 0 0";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "50 50";
     vissizeendscale = 10;
     visalphafunc_s = "BLEND";
     visalphastart = 255;
};

INSTANCE MFX_SUCKENERGY_ANI (C_PARTICLEFX)
{
     ppsvalue = 20;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 1;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 10";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "20 20 1";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "DIR";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     velavg = 0.0500000007;
     velvar = 0.0250000004;
     lsppartavg = 3000;
     lsppartvar = 1000;
     flygravity_s = "0 0 0";
     visname_s = "BADWEATH.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "128 0 0";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "12 12";
     vissizeendscale = 3;
     visalphafunc_s = "BLEND";
     visalphastart = 255;
};


INSTANCE MFX_SUCKENERGY_FLYTOPLAYER (C_PARTICLEFX)
{
     ppsvalue = 20;
     ppsscalekeys_s = "1 1 1 1 1";
     ppsissmooth = 1;
     ppsfps = 1;
     shptype_s = "SPHERE";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "40";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "TARGET";
     dirfor_s = "WORLD";
     dirmodetargetfor_s = "WORLD";
     dirmodetargetpos_s = "0 0 0";
     velavg = 0.300000012;
     velvar = 0.0549999997;
     lsppartavg = 8000;
     lsppartvar = 1000;
     flygravity_s = "0 0 0";
     visname_s = "BADWEATH.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "128 0 0";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "30 30";
     vissizeendscale = 1;
     visalphafunc_s = "BLEND";
     visalphastart = 255;
};

///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  B E L I A R S   R A G E        XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX


INSTANCE MFX_BELIARSZORN_INIT (C_PARTICLEFX)
{
     ppsvalue = 50;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "30";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelev = -90;
     velavg = 0.00100000005;
     lsppartavg = 1000;
     lsppartvar = 1000;
     flygravity_s = "0 0 0";
     visname_s = "BELIARSRAGE_CLOUD.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "5 5";
     vissizeendscale = 15;
     visalphafunc_s = "BLEND";
     visalphastart = 255;
};

INSTANCE MFX_BeliarsZorn_CAST (C_PARTICLEFX)
{
     ppsvalue = 50;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "5";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "WORLD";
     dirmodetargetpos_s = "0 0 0";
     diranglehead = 180;
     dirangleheadvar = 1;
     velavg = 0.00999999978;
     lsppartavg = 3000;
     lsppartvar = 500;
     flygravity_s = "0 0 0";
     visname_s = "BELIARSRAGE_CLOUD.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 2;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "30 30";
     vissizeendscale = 2;
     visalphafunc_s = "BLEND";
     visalphastart = 255;
};


INSTANCE MFX_BELIARSZORN_FLASH (C_PARTICLEFX)
{
     ppsvalue = 10;
     ppsscalekeys_s = "1 1 1";
     ppsissmooth = 1;
     ppsfps = 1;
     shptype_s = "POINT";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 400 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "5";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 5;
     dirmode_s = "DIR";
     dirfor_s = "WORLD";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleelev = 90;
     velavg = 0.00100000005;
     lsppartavg = 400;
     flygravity_s = "0 -0.0000001 0";
     visname_s = "BLACKFLASH_A0.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 12;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "100 500";
     vissizeendscale = 1;
     visalphafunc_s = "BLEND";
     visalphastart = 255;
     useemittersfor = 1;
};

INSTANCE MFX_BELIARSZORN_TARGET (C_PARTICLEFX)
{
     ppsvalue = 20;
     ppsscalekeys_s = "1 1";
     ppsissmooth = 1;
     ppsfps = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "500";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 0.600000024;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 0.400000006;
     velvar = 9.99999975e-005;
     lsppartavg = 1000;
     flygravity_s = "0 0 0";
     visname_s = "BELIARSRAGE_CLOUD.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 2;
     vistexcolorstart_s = "50 150 255";
     vistexcolorend_s = "50 0 255";
     vissizestart_s = "700 700";
     vissizeendscale = 0.100000001;
     visalphafunc_s = "BLEND";
     visalphastart = 255;
     trltexture_s = "WHITECLOUD.TGA";
};

// =============== I C E L A N C E

INSTANCE MFX_ICELANCE_INIT (C_PARTICLEFX)
{
     ppsvalue = 200;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1;
     shptype_s = "20";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.100000001;
     shpisvolume = 1;
     shpdim_s = "20";
     shpmesh_s = "ICELANCE.3DS";
     shpmeshrender_b = 2;
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 0.00999999978;
     lsppartavg = 300;
     flygravity_s = "0 0 0";
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "50 50";
     vissizeendscale = 0.100000001;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     visalphaend = 50;
     useemittersfor = 1;
};

INSTANCE MFX_ICELANCE_CAST (C_PARTICLEFX)
{
     ppsvalue = 200;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 5;
     shptype_s = "MESH";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.000300000014;
     shpisvolume = 1;
     shpdim_s = "1";
     shpmesh_s = "ICELANCE.3DS";
     shpmeshrender_b = 2;
     shpscalekeys_s = "1";
     shpscalefps = 5;
     dirmode_s = "DIR";
     dirfor_s = "WORLD";
     lsppartavg = 300;
     lsppartvar = 100;
     visname_s = "MFX_SLEEP_STAR.TGA";
     vistexisquadpoly = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "30 30";
     vissizeendscale = 0.100000001;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     visalphaend = 255;
};

INSTANCE MFX_ICELANCE_COLLIDE (C_PARTICLEFX)
{
     ppsvalue = 200;
     ppsscalekeys_s = "1";
     ppsfps = 5;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "20";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 0.400000006;
     lsppartavg = 1000;
     flygravity_s = "0 -0.001 0";
     flycolldet_b = 3;
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "50 50";
     vissizeendscale = 1;
     visalphafunc_s = "ADD";
     visalphastart = 255;
};

// =============== W A T E R W A L L

INSTANCE MFX_WATERWALL_WALL (C_PARTICLEFX)
{
     ppsvalue = 30;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1;
     ppscreateem_s = "=";
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 200 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "150 50 10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 0.00300000003;
     velvar = 0.00100000005;
     lsppartavg = 500;
     flygravity_s = "0 0 0";
     visname_s = "WATERWALL.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 2;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "128 255 255";
     vissizestart_s = "300 250";
     vissizeendscale = 1.20000005;
     visalphafunc_s = "BLEND";
     visalphastart = 255;
     useemittersfor = 1;
};

INSTANCE MFX_WATERWALL_GROUNDSPLASH (C_PARTICLEFX)
{
     ppsvalue = 80;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 -50 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "150 10 10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 0.00300000003;
     velvar = 0.00100000005;
     lsppartavg = 1000;
     flygravity_s = "0 0 0";
     visname_s = "SIMPLEGLOW.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "128 255 255";
     vissizestart_s = "10 10";
     vissizeendscale = 5;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     useemittersfor = 1;
};

// =============== W A T E R F I S T

INSTANCE MFX_WATERFIST_INIT (C_PARTICLEFX)
{
     ppsvalue = 50;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1;
     shptype_s = "SPHERE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.100000001;
     shpisvolume = 1;
     shpdim_s = "5";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 0.00999999978;
     lsppartavg = 1000;
     flygravity_s = "0 0 0";
     visname_s = "WATERFIST.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "15 15";
     vissizeendscale = 2;
     visalphafunc_s = "BLEND";
     visalphastart = 255;
     visalphaend = 50;
     useemittersfor = 1;
};

INSTANCE MFX_WATERFIST_CAST (C_PARTICLEFX)
{
     ppsvalue = 300;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1;
     shptype_s = "SPHERE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "20 5 5";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.100000001;
     shpisvolume = 1;
     shpdim_s = "5";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 0.100000001;
     lsppartavg = 1000;
     flygravity_s = "0 0 0";
     visname_s = "WATERFIST.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255 ";
     vissizestart_s = "15 100";
     vissizeendscale = 2;
     visalphafunc_s = "BLEND";
     visalphastart = 255;
};

INSTANCE MFX_WATERFIST_COLLIDE (C_PARTICLEFX)
{
     ppsvalue = 20;
     ppsscalekeys_s = "1";
     ppsfps = 5;
     ppscreateem_s = "MFX_WATERFIST_COLLIDE2";
     ppscreateemdelay = 400;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "8";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 0.00100000005;
     lsppartavg = 1000;
     flygravity_s = "0 0 0";
     flycolldet_b = 3;
     visname_s = "WATERFIST_EXPL.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 20";
     vissizeendscale = 35;
     visalphafunc_s = "BLEND";
     visalphastart = 255;
};


INSTANCE MFX_WATERFIST_COLLIDE2 (C_PARTICLEFX)
{
     ppsvalue = 2500;
     ppsscalekeys_s = "1";
     ppsfps = 10;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "8";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 0.800000012;
     velvar = 0.200000003;
     lsppartavg = 3000;
     flygravity_s = "0 -0.001 0";
     flycolldet_b = 3;
     visname_s = "INFLATE_WATER.TGA";
     visorientation_s = "VELO";
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "40 40";
     visalphafunc_s = "BLEND";
     visalphastart = 255;
     visalphaend = 255;
};



// =============== S W A R M

INSTANCE MFX_SWARM_INIT (C_PARTICLEFX)
{
     ppsvalue = 50;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsfps = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "30";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 0.060000012;
     velvar = 0.029999982;
     lsppartavg = 400;
     lsppartvar = 100;
     flygravity_s = "0 0 0";
     visname_s = "PLAGUE3.TGA";
     visorientation_s = "VELO3D";
     vistexanifps = 10;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "10 10";
     vissizeendscale = 1;
     visalphafunc_s = "BLEND";
     visalphastart = 255;
     visalphaend = 255;
};

INSTANCE MFX_SWARM_CAST (C_PARTICLEFX)
{
     ppsvalue = 50;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsfps = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "20";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1;
     dirmode_s = "DIR";
     dirfor_s = "object";
     diranglehead = 5;
     dirangleheadvar = 10;
     dirangleelevvar = 10;
     velavg = 0.100000001;
     lsppartavg = 1000;
     lsppartvar = 100;
     flygravity_s = "0 0 0";
     visname_s = "PLAGUE3.TGA";
     visorientation_s = "VELO3D";
     vistexanifps = 10;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 20";
     vissizeendscale = 1;
     visalphafunc_s = "BLEND";
     visalphastart = 255;
     visalphaend = 255;
     useemittersfor = 1;
};

INSTANCE MFX_SWARM_TARGET1 (C_PARTICLEFX)
{
     ppsvalue = 80;
     ppsscalekeys_s = "1 1 1 1 1 1 1 1 1 1";
     ppsfps = 2;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "500";
     shpscalekeys_s = "5 4 3 2 1 1 1 1 1 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 0.300000012;
     velvar = 0.0799999982;
     lsppartavg = 2500;
     lsppartvar = 100;
     flygravity_s = "0 0 0";
     visname_s = "PLAGUE1.TGA";
     visorientation_s = "VELO3D";
     vistexanifps = 10;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 20";
     visalphafunc_s = "BLEND";
     visalphastart = 255;
     visalphaend = 255;
     useemittersfor = 1;
};

INSTANCE MFX_SWARM_TARGET2 (C_PARTICLEFX)
{
     ppsvalue = 80;
     ppsscalekeys_s = "1 1 1 1 1 1 1 1 1 1";
     ppsfps = 2;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "500";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 0.300000012;
     velvar = 0.0799999982;
     lsppartavg = 2500;
     lsppartvar = 100;
     flygravity_s = "0 0 0";
     visname_s = "PLAGUE2.TGA";
     visorientation_s = "VELO3D";
     vistexanifps = 10;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 20";
     visalphafunc_s = "BLEND";
     visalphastart = 255;
     visalphaend = 255;
     useemittersfor = 1;
};

INSTANCE MFX_SWARM_TARGET3 (C_PARTICLEFX)
{
     ppsvalue = 80;
     ppsscalekeys_s = "1 1 1 1 1 1 1 1 1 1";
     ppsfps = 2;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "500";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 0.300000012;
     velvar = 0.0799999982;
     lsppartavg = 2500;
     lsppartvar = 100;
     flygravity_s = "0 0 0";
     visname_s = "PLAGUE3.TGA";
     visorientation_s = "VELO3D";
     vistexanifps = 10;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 20";
     visalphafunc_s = "BLEND";
     visalphastart = 255;
     visalphaend = 255;
     useemittersfor = 1;
};


// =============== G R E E N T E N T A C L E

INSTANCE MFX_GREENTENTACLE_INIT (C_PARTICLEFX)
{
     ppsvalue = 20;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1;
     shptype_s = "SPHERE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.100000001;
     shpisvolume = 1;
     shpdim_s = "5";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 0.00999999978;
     lsppartavg = 1000;
     flygravity_s = "0 0 0";
     visname_s = "ROOTNOOSE.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 225 255";
     vissizestart_s = "20 20";
     vissizeendscale = 2;
     visalphafunc_s = "BLEND";
     visalphastart = 255;
     useemittersfor = 1;
};


INSTANCE MFX_GREENTENTACLE_CAST (C_PARTICLEFX)
{
     ppsvalue = 20;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1;
     shptype_s = "SPHERE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "20 5 5";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.100000001;
     shpisvolume = 1;
     shpdim_s = "5";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 0.00999999978;
     lsppartavg = 1000;
     flygravity_s = "0 ROOTNOOSE 0";
     visname_s = "ROOTNOOSE.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255 ";
     vissizestart_s = "50 50";
     vissizeendscale = 2;
     visalphafunc_s = "BLEND";
     visalphastart = 255;
};


INSTANCE MFX_GREENTENTACLE_SPREAD (C_PARTICLEFX)
{
     ppsvalue = 15;
     ppsscalekeys_s = "1";
     ppsfps = 2;
     shptype_s = "CIRCLE";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 -60 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "1500";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleissmooth = 1;
     dirmode_s = "RAND";
     dirfor_s = "WORLD";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 10;
     dirangleelev = 90;
     dirangleelevvar = 10;
     velavg = 0.00100000005;
     lsppartavg = 20000;
     visname_s = "ROOTNOOSE.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "30 30";
     vissizeendscale = 8;
     visalphafunc_s = "BLEND";
     visalphastart = 255;
     visalphaend = 255;
};

INSTANCE MFX_GREENTENTACLE_TARGET (C_PARTICLEFX)
{
     ppsvalue = 10;
     ppsscalekeys_s = "1";
     ppsfps = 2;
     ppscreateem_s = "MFX_GREENTENTACLE_BURST";
     ppscreateemdelay = 20500;
     shptype_s = "CIRCLE";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 -60 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "60";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleissmooth = 1;
     dirmode_s = "RAND";
     dirfor_s = "WORLD";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 10;
     dirangleelev = 90;
     dirangleelevvar = 10;
     velavg = 0.00100000005;
     lsppartavg = 20000;
     visname_s = "ROOTNOOSE.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "15 15";
     vissizeendscale = 8;
     visalphafunc_s = "BLEND";
     visalphastart = 255;
     visalphaend = 255;
};

INSTANCE MFX_GREENTENTACLE_BURST (C_PARTICLEFX)
{
     ppsvalue = 200;
     ppsscalekeys_s = "1";
     ppsfps = 5;
     shptype_s = "SPHERE";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "200";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleissmooth = 1;
     dirmode_s = "RAND";
     dirfor_s = "WORLD";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 10;
     dirangleelev = 90;
     dirangleelevvar = 10;
     velavg = 0.200000003;
     lsppartavg = 1000;
     flygravity_s = "0 -0.001 0";
     flycolldet_b = 3;
     visname_s = "ROOTNOOSE_BURST.TGA";
     visorientation_s = "VELO";
     vistexanifps = 18;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "100 100";
     visalphafunc_s = "BLEND";
     visalphastart = 255;
     visalphaend = 255;
     useemittersfor = 1;
};

INSTANCE MFX_GREENTENTACLE_GROUNDGLOW (C_PARTICLEFX)
{
     ppsvalue = 1000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 1;
     shptype_s = "BOX";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 400 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "500 10 500";
     shpscalekeys_s = "1";
     shpscaleissmooth = 1;
     shpscalefps = 5;
     dirmode_s = "DIR";
     dirfor_s = "WORLD";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 10;
     dirangleelev = -90;
     dirangleelevvar = 10;
     velavg = 2;
     lsppartavg = 3000;
     lsppartvar = 1500;
     flygravity_s = "0 0 0";
     flycolldet_b = 3;
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18;
     vistexcolorstart_s = "50 50 50";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "35 35";
     vissizeendscale = 0.100000001;
     visalphafunc_s = "ADD";
     visalphaend = 255;
     mrkfadespeed = 1;
     mrktexture_s = "ROOTNOOSE_GROUND.TGA";
     mrksize = 100;
};

// =============== I N F L A T E

INSTANCE MFX_INFLATE_TEST (C_PARTICLEFX)
{
     ppsvalue = 200;
     ppsscalekeys_s = "2 1 1 1 1 1 0.8 0.6 0.4 0.2";
     ppsfps = 1;
     shptype_s = "POINT";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "20 0 0";
     shpdistribtype_s = "BOX";
     shpdim_s = "20 2 2";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleissmooth = 1;
     dirmode_s = "DIR";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 2;
     dirangleelevvar = 2;
     velavg = 0.600000024;
     velvar = 0.100000001;
     lsppartavg = 1700;
     lsppartvar = 300;
     flygravity_s = "0 -0.0008 0";
     flycolldet_b = 1;
     visname_s = "INFLATE_WATER.TGA";
     visorientation_s = "VELO3D";
     vistexanifps = 18;
     vistexcolorstart_s = "200 220 250";
     vistexcolorend_s = "128 200 255";
     vissizestart_s = "5 25";
     visalphafunc_s = "BLEND";
     visalphastart = 150;
     visalphaend = 50;
     mrkfadespeed = 0.600000024;
     mrktexture_s = "ROOTNOOSE_GROUND.TGA";
     mrksize = 20;
};

PROTOTYPE MFX_INFLATE_FOUNTAIN (C_PARTICLEFX)
{
     ppsvalue = 200;
     ppsscalekeys_s = "2 1 1 1 1 1 0.8 0.6 0.4 0.2";
     ppsfps = 1;
     shptype_s = "POINT";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "20 0 0";
     shpdistribtype_s = "BOX";
     shpdim_s = "20 2 2";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleissmooth = 1;
     dirmode_s = "DIR";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 2;
     dirangleelevvar = 2;
     velavg = 0.600000024;
     velvar = 0.100000001;
     lsppartavg = 1700;
     lsppartvar = 300;
     flygravity_s = "0 -0.0008 0";
     visname_s = "INFLATE_WATER.TGA";
     visorientation_s = "VELO3D";
     vistexanifps = 18;
     vistexcolorstart_s = "200 220 250";
     vistexcolorend_s = "128 200 255";
     vissizestart_s = "5 25";
     visalphafunc_s = "BLEND";
     visalphastart = 150;
     visalphaend = 50;
};


INSTANCE MFX_INFLATE_FOUNTAIN_0 (MFX_INFLATE_FOUNTAIN)
{
    diranglehead = 0;
};

INSTANCE MFX_INFLATE_FOUNTAIN_15 (MFX_INFLATE_FOUNTAIN)
{
    diranglehead = 25;
};

INSTANCE MFX_INFLATE_FOUNTAIN_340 (MFX_INFLATE_FOUNTAIN)
{
    diranglehead = 340;
};

INSTANCE MFX_INFLATE_FOUNTAIN_90 (MFX_INFLATE_FOUNTAIN)
{
    diranglehead = 170;
};

INSTANCE MFX_INFLATE_FOUNTAIN_180 (MFX_INFLATE_FOUNTAIN)
{
    diranglehead = 160;
};

INSTANCE MFX_INFLATE_FOUNTAIN_250 (MFX_INFLATE_FOUNTAIN)
{
    diranglehead = 250;
};

INSTANCE MFX_INFLATE_FOUNTAIN_270 (MFX_INFLATE_FOUNTAIN)
{
    diranglehead = -70;
};
// =============== G E Y S E R

INSTANCE MFX_GEYSER_INIT (C_PARTICLEFX)
{
     ppsvalue = 100;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsfps = 2;
     shptype_s = "POINT";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "30";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleissmooth = 1;
     dirmode_s = "DIR";
     dirfor_s = "WORLD";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 10;
     dirangleelev = 90;
     dirangleelevvar = 10;
     velavg = 0.100000001;
     lsppartavg = 300;
     lsppartvar = 100;
     flygravity_s = "0 0 0";
     visname_s = "GEYSER.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "1.5 2";
     vissizeendscale = 30;
     visalphafunc_s = "BLEND";
     visalphastart = 255;
};

INSTANCE MFX_GEYSER_CAST (C_PARTICLEFX)
{
     ppsvalue = 100;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsfps = 2;
     shptype_s = "POINT";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "30";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleissmooth = 1;
     dirmode_s = "RAND";
     dirfor_s = "WORLD";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 10;
     dirangleelev = 90;
     dirangleelevvar = 10;
     velavg = 0.0199999996;
     lsppartavg = 2000;
     lsppartvar = 100;
     flygravity_s = "0 -0.0002 0";
     flycolldet_b = 3;
     visname_s = "GEYSER_DROP.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "1 1";
     vissizeendscale = 5;
     visalphafunc_s = "ADD";
     visalphastart = 180;
     useemittersfor = 1;
};

INSTANCE MFX_GEYSER_FOUNTAIN (C_PARTICLEFX)
{
     ppsvalue = 10;
     ppsscalekeys_s = "1";
     ppsfps = 2;
     ppscreateem_s = "MFX_GEYSER_PARTICLES";
     ppscreateemdelay = 500;
     shptype_s = "POINT";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 -50 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "30";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleissmooth = 1;
     dirmode_s = "DIR";
     dirfor_s = "WORLD";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 10;
     dirangleelev = 90;
     dirangleelevvar = 10;
     velavg = 1;
     lsppartavg = 2000;
     lsppartvar = 100;
     flygravity_s = "0 0 0";
     visname_s = "GEYSER.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "30 40";
     vissizeendscale = 60;
     visalphafunc_s = "BLEND";
     visalphastart = 255;
};

INSTANCE MFX_GEYSER_PARTICLES (C_PARTICLEFX)
{
     ppsvalue = 1500;
     ppsscalekeys_s = "1";
     ppsfps = 2;
     shptype_s = "POINT";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 -20 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "20";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleissmooth = 1;
     dirmode_s = "DIR";
     dirfor_s = "WORLD";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 45;
     dirangleelev = 90;
     dirangleelevvar = 30;
     velavg = 1;
     velvar = 0.25;
     lsppartavg = 2000;
     lsppartvar = 100;
     flygravity_s = "0 -0.001 0";
     visname_s = "GEYSER_DROP.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "128 128 128";
     vissizestart_s = "5 5";
     vissizeendscale = 1;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     visalphaend = 255;
};


// =============== W H I R L W I N D

INSTANCE MFX_WHIRLWIND_INIT (C_PARTICLEFX)
{
     ppsvalue = 60;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsfps = 1;
     shptype_s = "SPHERE";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 20 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "3";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleissmooth = 1;
     dirmode_s = "DIR";
     dirfor_s = "WORLD";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 1;
     dirangleelev = 90;
     dirangleelevvar = 1;
     velavg = 0.100000001;
     velvar = 0.0250000004;
     lsppartavg = 200;
     lsppartvar = 100;
     flygravity_s = "0 0 0";
     visname_s = "WHIRLWIND.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "128 128 128";
     vissizestart_s = "30 30";
     vissizeendscale = 2;
     visalphafunc_s = "BLEND";
     visalphastart = 150;
};


INSTANCE MFX_WHIRLWIND_CAST (C_PARTICLEFX)
{
     ppsvalue = 15;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsfps = 1;
     shptype_s = "SPHERE";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 20 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleissmooth = 1;
     dirmode_s = "DIR";
     dirfor_s = "WORLD";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 10;
     dirangleelev = 90;
     dirangleelevvar = 10;
     velavg = 0.400000006;
     velvar = 0.25;
     lsppartavg = 1000;
     lsppartvar = 100;
     flygravity_s = "0 0 0";
     visname_s = "WHIRLWIND.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "128 128 128";
     vissizestart_s = "100 100";
     vissizeendscale = 3;
     visalphafunc_s = "BLEND";
     visalphastart = 255;
};

INSTANCE MFX_WHIRLWIND_GROW (C_PARTICLEFX)
{
     ppsvalue = 15;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsfps = 1;
     shptype_s = "SPHERE";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 20 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleissmooth = 1;
     dirmode_s = "DIR";
     dirfor_s = "WORLD";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 10;
     dirangleelev = 90;
     dirangleelevvar = 10;
     velavg = 0.400000006;
     velvar = 0.25;
     lsppartavg = 1000;
     lsppartvar = 100;
     flygravity_s = "0 0 0";
     visname_s = "WHIRLWIND.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "128 128 128";
     vissizestart_s = "100 100";
     vissizeendscale = 3;
     visalphafunc_s = "BLEND";
     visalphastart = 160;
};


INSTANCE MFX_WHIRLWIND_TARGET (C_PARTICLEFX)
{
     ppsvalue = 1;
     ppsscalekeys_s = "15 15 15 15 15 15 15 14 13 12 11 10";
     ppsfps = 1;
     ppscreateem_s = "MFX_WHIRLWIND_TARGET2";
     shptype_s = "SPHERE";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 -50 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleissmooth = 1;
     dirmode_s = "DIR";
     dirfor_s = "WORLD";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 10;
     dirangleelev = 90;
     dirangleelevvar = 10;
     velavg = 0.400000006;
     velvar = 0.25;
     lsppartavg = 1000;
     lsppartvar = 100;
     flygravity_s = "0 0 0";
     visname_s = "WHIRLWIND.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "128 128 128";
     vissizestart_s = "100 100";
     vissizeendscale = 3;
     visalphafunc_s = "BLEND";
     visalphastart = 200;
};


INSTANCE MFX_WHIRLWIND_TARGET2 (C_PARTICLEFX)
{
     ppsvalue = 1;
     ppsscalekeys_s = "15 15 15 15 15 15 15 14 13 12 11 10";
     ppsfps = 1;
     shptype_s = "SPHERE";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 -50 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "30";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleissmooth = 1;
     dirmode_s = "DIR";
     dirfor_s = "WORLD";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleelev = -90;
     velavg = 0.00100000005;
     velvar = 9.99999975e-005;
     lsppartavg = 1000;
     lsppartvar = 100;
     flygravity_s = "0 -0.002 0";
     visname_s = "WHIRLWIND2.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 2;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "128 128 128";
     vissizestart_s = "300 300";
     vissizeendscale = 0.100000001;
     visalphafunc_s = "BLEND";
     visalphastart = 200;
};


INSTANCE MFX_WHIRLWIND_ORIGIN (C_PARTICLEFX)
{
     ppsvalue = 20;
     ppsscalekeys_s = "1 1.4 1.8 2.2 2.6 3 3.4 3.8 4.2 4.6 5 5 5 5 5 5 5";
     ppsfps = 3;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 400 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 2;
     shpdim_s = "200";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 10;
     dirmode_s = "TARGET";
     dirmodetargetfor_s = "OBJECT";
     velavg = 0.200000003;
     lsppartavg = 1750;
     lsppartvar = 500;
     flygravity_s = "0 0 0";
     visname_s = "BADWEATH.TGA";
     vistexisquadpoly = 1;
     vistexanifps = 3;
     vistexaniislooping = 2;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "64 64 64";
     vissizestart_s = "200 200";
     visalphafunc_s = "BLEND";
     visalphaend = 255;
     //useemittersfor = 1;
};

// =================================================================================================
// =================================================================================================
// =========     A D D O N   B L O C K   E N D                                        ==============
// =================================================================================================
// =================================================================================================


PROTOTYPE LIGHTSTAR (C_PARTICLEFX)
{
     ppsvalue = 50;
     ppsscalekeys_s = "1 1 1";
     ppsissmooth = 1;
     ppsfps = 1;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "UNIFORM";
     shpdim_s = "10";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleissmooth = 1;
     dirmode_s = "RAND";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 0.00999999978;
     lsppartavg = 2000;
     lsppartvar = 100;
     flygravity_s = "0 0 0";
     visname_s = "HEAVENLIGHT.TGA";
     visorientation_s = "VELO3D";
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 0 0";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "2 50";
     vissizeendscale = 30;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     useemittersfor = 1;
};

INSTANCE LIGHTSTAR_RED   (LIGHTSTAR)
{
	vistexcolorstart_s = "255 0 0";
    vistexcolorend_s = "255 0 0";
};

INSTANCE LIGHTSTAR_WHITE (LIGHTSTAR)
{
	vistexcolorstart_s = "255 255 255";
    vistexcolorend_s = "255 255 255";
};

INSTANCE LIGHTSTAR_BLUE (LIGHTSTAR)
{
	vistexcolorstart_s = "0 0 255";
    vistexcolorend_s = "0 0 255";
};
INSTANCE LIGHTSTAR_ORANGE (LIGHTSTAR)
{
     vistexcolorstart_s = "255 150 0";
     vistexcolorend_s = "150 0 0";
};
INSTANCE LIGHTSTAR_GREEN (LIGHTSTAR)
{
	vistexcolorstart_s = "0 255 150";
    vistexcolorend_s = "0 255 150";
};

INSTANCE LIGHTSTAR_VIOLET (LIGHTSTAR)
{
	vistexcolorstart_s = "200 0 255";
    vistexcolorend_s = "250 0 200";
};

PROTOTYPE INVOCATION (C_PARTICLEFX)
{
     ppsvalue = 30;
     ppsscalekeys_s = "1 1 2 2 2 3 3 4 4 5";
     ppsissmooth = 1;
     ppsfps = 3;
     shptype_s = "CIRCLE";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "120";
     shpscalekeys_s = "1 2 3 4 5 6 7 8 9 10";
     shpscaleissmooth = 1;
     shpscalefps = 3;
     dirmode_s = "RAND";
     dirfor_s = "object";
     diranglehead = 90;
     dirangleheadvar = 45;
     dirangleelev = 90;
     dirangleelevvar = 45;
     velavg = 0.100000001;
     lsppartavg = 1500;
     lsppartvar = 300;
     flygravity_s = "0 0.00008 0";
     visname_s = "MFX_MAGICCLOUD.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 25;
     vistexaniislooping = 2;
     vistexcolorstart_s = "255 0 0";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "20 20";
     vissizeendscale = 20;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     trltexture_s = "LIGHTNING_BIG_A0.TGA";
};

INSTANCE INVOCATION_RED  (INVOCATION)
{
	vistexcolorstart_s = "255 0 0";
    vistexcolorend_s = "255 0 0";
};

INSTANCE INVOCATION_WHITE  (INVOCATION)
{
	vistexcolorstart_s = "255 255 255";
    vistexcolorend_s = "255 255 255";
};

INSTANCE INVOCATION_BLUE  (INVOCATION)
{
	vistexcolorstart_s = "0 0 255";
    vistexcolorend_s = "0 0 255";
};

INSTANCE INVOCATION_GREEN  (INVOCATION)
{
	vistexcolorstart_s = "0 200 200";
    vistexcolorend_s = "0 200 200";
};

INSTANCE INVOCATION_VIOLET  (INVOCATION)
{
	vistexcolorstart_s = "200 0 255";
    vistexcolorend_s = "255 0 200";
};

INSTANCE MFX_HealShrine (C_PARTICLEFX)
{
     ppsvalue = 20;
     ppsscalekeys_s = "1 1 1";
     ppsissmooth = 1;
     ppsfps = 1;
     shptype_s = "CIRCLE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 400 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1 2 3 4 5 6 7";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 5;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 9.99999975e-005;
     lsppartavg = 5000;
     flygravity_s = "0 -0.0001 0";
     visname_s = "HEAVENLIGHT.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 1;
	 vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "32 128";
     vissizeendscale = 2;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     useEmittersFOR = 1;
};
INSTANCE MFX_Innoseye (C_PARTICLEFX)
{
     ppsvalue = 20;
     ppsscalekeys_s = "1 1 1";
     ppsissmooth = 1;
     ppsfps = 1;
     shptype_s = "CIRCLE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 400 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1 2 3 4 5 6 7";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 5;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 9.99999975e-005;
     lsppartavg = 5000;
     flygravity_s = "0 -0.0001 0";
     visname_s = "HEAVENLIGHT.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 1;
	 vistexcolorstart_s = "255 0 0";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "32 128";
     vissizeendscale = 2;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     useEmittersFOR = 1;
};

INSTANCE MFX_RINGRITUAL2 (C_PARTICLEFX)
{
     ppsvalue = 50.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1 0.8 0.6 0.4 0.2";
     ppsfps = 1.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 -120 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "1000";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscalefps = 7.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     diranglehead = 45.000000000;
     dirangleelev = 45.000000000;
     velavg = 0.029999999;
     lsppartavg = 1000.000000000;
     lsppartvar = 100.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 3;
     visname_s = "FIRE_COMPLETE_A1.TGA";
     visorientation_s = "0";
     vistexisquadpoly = 1;
     vistexanifps = 3.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "20 0 0";
     vissizestart_s = "50 10";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "ADD";
     visalphaend = 255.000000000;
     trltexture_s = "MFX_FIRERAIN_RAINTRAIL.TGA";
     mrktexture_s = "=";
};

INSTANCE MFX_BELIARSRAGE_FLASH (C_PARTICLEFX)
{
     ppsvalue = 10;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 1;
     shptype_s = "POINT";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 400 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "5";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 5;
     dirmode_s = "DIR";
     dirfor_s = "WORLD";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleelev = 90;
     velavg = 0.00100000005;
     lsppartavg = 200;
     flygravity_s = "0 -0.0000001 0";
     visname_s = "LIGHTNINGNEU_BIG_A0.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 20;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 150 255";
     vistexcolorend_s = "150 0 255";
     vissizestart_s = "100 500";
     vissizeendscale = 1;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     useemittersfor = 1;
};
INSTANCE MFX_BELIARSRAGE_TARGET (C_PARTICLEFX)
{
     ppsvalue = 20;
     ppsscalekeys_s = "1 1";
     ppsissmooth = 1;
     ppsfps = 2.5;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "300";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 0.600000024;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 0.00999999978;
     velvar = 9.99999975e-005;
     lsppartavg = 300;
     flygravity_s = "0 0 0";
     visname_s = "LIGHTNING_ORIGIN_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 1;
    vistexcolorstart_s = "150 150 255";
     vistexcolorend_s = "150 0 255";
     vissizestart_s = "30 30";
     vissizeendscale = 20;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     trltexture_s = "WHITECLOUD.TGA";
};

INSTANCE DRAGON_DIE (C_PARTICLEFX)
{
     ppsvalue = 100;
     ppsscalekeys_s = "1 1 1";
     ppsislooping = 0;
     ppsissmooth = 1;
     ppsfps = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "UNIFORM";
     shpdim_s = "10";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleissmooth = 1;
     dirmode_s = "RAND";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 0.00999999978;
     lsppartavg = 2000;
     lsppartvar = 100;
     flygravity_s = "0 0 0";
     visname_s = "HEAVENLIGHT.TGA";
     visorientation_s = "VELO3D";
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "50 150 255";
     vistexcolorend_s = "50 0 255";
     vissizestart_s = "1 50";
     vissizeendscale = 30;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     useemittersfor = 1;
};

INSTANCE DRAGON_DIE_SMOKE (C_PARTICLEFX)
{
     ppsvalue = 15;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 1;
     shptype_s = "CIRCLE";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "150";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleissmooth = 1;
     dirmode_s = "RAND";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 0.00999999978;
     lsppartavg = 4000;
     lsppartvar = 100;
     flygravity_s = "0 0 0";
     visname_s = "MFX_BREATHOFDEATH.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 20";
     vissizeendscale = 30;
     visalphafunc_s = "BLEND";
     visalphastart = 255;
     useemittersfor = 1;
};


INSTANCE MFX_LIGHTNING_GLOW (C_PARTICLEFX)
{
     ppsvalue = 10;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "100";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelev = -90;
     velavg = 0.00100000005;
     lsppartavg = 4000;
     lsppartvar = 1000;
     flygravity_s = "0 -0.0000001 0";
     visname_s = "MFX_MAGICCLOUD.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 2;
     vistexcolorstart_s = "0 0 255";
     vistexcolorend_s = "0 255 255";
     vissizestart_s = "50 50";
     vissizeendscale = 2;
     visalphafunc_s = "ADD";
     visalphastart = 255;
};

INSTANCE MFX_TEST1 (C_PARTICLEFX)
{
     ppsvalue = 10;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 6;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 400 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "5";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 5;
     dirmode_s = "DIR";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleelev = 90;
     velavg = 0.00100000005;
     lsppartavg = 300;
     flygravity_s = "0 -0.0000001 0";
     visname_s = "LIGHTNINGNEU_BIG_A0.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 25;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "100 500";
     vissizeendscale = 1;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     useemittersfor = 1;
};

INSTANCE MFX_BODTEST2 (C_PARTICLEFX)
{
     ppsvalue = 400;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2;
     shptype_s = "MESH";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "200";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "DIR";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelev = -90;
     velavg = 0.00100000005;
     velvar = 0.0299999993;
     lsppartavg = 1000;
     flygravity_s = "0 0 0";
     visname_s = "HEAVENLIGHT.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 2;
     vistexcolorstart_s = "255 0 0";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "5 25";
     vissizeendscale = 5;
     visalphafunc_s = "ADD";
     visalphastart = 255;
};


INSTANCE TEST1 (C_PARTICLEFX)
{
     ppsvalue = 30;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1000 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "300";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 0.600000024;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 0.00999999978;
     velvar = 9.99999975e-005;
     lsppartavg = 300;
     flygravity_s = "0 0 0";
     visname_s = "LIGHTNING_ORIGIN_A0.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "50 150 255";
     vistexcolorend_s = "50 0 255";
     vissizestart_s = "50 50";
     vissizeendscale = 3;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     trltexture_s = "WHITECLOUD.TGA";
};

INSTANCE TEST2 (C_PARTICLEFX)
{
     ppsvalue = 20;
     ppsscalekeys_s = "10 9 8 7 6 5 4 3 2 1";
     ppsissmooth = 1;
     ppsfps = 1;
     shptype_s = "CIRCLE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 -60 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.000300000014;
     shpisvolume = 1;
     shpdim_s = "100";
     shpscalekeys_s = "1";
     shpscaleissmooth = 1;
     shpscalefps = 1;
     dirmode_s = "RAND";
     dirfor_s = "WORLD";
     velavg = 0.00999999978;
     lsppartavg = 500;
     lsppartvar = 100;
     visname_s = "MFX_MAGICCLOUD.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexaniislooping = 2;
     vistexcolorstart_s = "150 255 255";
     vistexcolorend_s = "0 150 255";
     vissizestart_s = "30 30";
     vissizeendscale = 2;
     visalphafunc_s = "ADD";
     visalphastart = 255;
};

INSTANCE TEST3 (C_PARTICLEFX)
{
     ppsvalue = 50;
     ppsscalekeys_s = "1 1 1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "UNIFORM";
     shpdim_s = "10";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleissmooth = 1;
     dirmode_s = "RAND";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 0.00999999978;
     lsppartavg = 2000;
     lsppartvar = 100;
     flygravity_s = "0 0 0";
     visname_s = "HEAVENLIGHT.TGA";
     visorientation_s = "VELO3D";
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 0 0";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "2 50";
     vissizeendscale = 30;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     useemittersfor = 1;
};

INSTANCE TEST4 (C_PARTICLEFX)
{
     ppsvalue = 50;
     ppsscalekeys_s = "5";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "30";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 0.00800000038;
     velvar = 0.0299999993;
     lsppartavg = 1000;
     flygravity_s = "0 0 0";
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "VELO3D";
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 200 200";
     vistexcolorend_s = "200 150 0";
     vissizestart_s = "25 25";
     vissizeendscale = 3;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     trlfadespeed = 0.100000001;
     trltexture_s = "HEAVENLIGHT.TGA";
     trlwidth = 15;
     useemittersfor = 1;
};

///   													XXXXXXXXXXXXXXXXXXXXXXX
///   													XX  P R A C T I C E  XX
///   													XXXXXXXXXXXXXXXXXXXXXXX


INSTANCE PRACTICEMAGIC_01A (C_PARTICLEFX)
{
     ppsvalue = 1000.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1 1 1";
     ppsfps = 5.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "45 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.000100000;
     lsppartavg = 200.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_LIGHT_SINGLERAY2.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 255 0";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "2 10";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE PRACTICEMAGIC_01B (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1 1 1";
     ppsfps = 5.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "45 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "15";
     shpscalekeys_s = "1 1 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.000100000;
     lsppartavg = 500.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_LIGHT_SINGLERAY2.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 255 0";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "2 10";
     vissizeendscale = 50.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};


INSTANCE PRACTICEMAGIC_02a (C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1";
     ppsfps = 10.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "OBJECT";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 0.000300000;
     shpdim_s = "15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     velavg = 0.050000001;
     lsppartavg = 800.000000000;
     lsppartvar = 100.000000000;
     visname_s = "TELSTURM.TGA";
     visorientation_s = "NONE";
     vistexcolorstart_s = "100 255 255";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "5 5";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE PRACTICEMAGIC_02B (C_PARTICLEFX)
{
     ppsvalue = 500.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 -100 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.000300000;
     shpdim_s = "50";
     shpscalekeys_s = "1";
     shpscalefps = 5.000000000;
     dirmode_s = "DIR";
     dirfor_s = "WORLD";
     lsppartavg = 3000.000000000;
     lsppartvar = 100.000000000;
     flygravity_s = "0 0.0001 0";
     visname_s = "LIGHTNING_BIG_A0.TGA";
     vistexcolorstart_s = "0 0 0";
     vistexcolorend_s = "0 100 255";
     vissizestart_s = "40 40";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE PracticeMagic_03 (C_PARTICLEFX)
{
     ppsvalue = 400.000000000;
     ppsscalekeys_s = "";
     //ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.100000001;
     lsppartavg = 2000.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 0";
     vissizestart_s = "20 20";
     vissizeendscale = 0.010000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

INSTANCE PRACTICEMAGIC_04 (C_PARTICLEFX)
{
     ppsvalue = 150.000000000;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RANDOM";
     shpdim_s = "8";
     shpscalekeys_s = "1 2 3 4 5 6 7 8 9 10";
     shpscalefps = 20.000000000;
     dirmode_s = "DIR";
     dirangleheadvar = 360.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0.200000003;
     lsppartavg = 500.000000000;
     lsppartvar = 200.000000000;
     flygravity_s = "0 0.001 0";
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 200 200";
     vistexcolorend_s = "255 200 200";
     vissizestart_s = "80 80";
     vissizeendscale = 0.500000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};


///   													XXXXXXXXXXXXXXXXXXXXXXX
///   													XX  S C R I P T      XX
///   													XXXXXXXXXXXXXXXXXXXXXXX


INSTANCE MFX_TELEPORT_SKRIPT (C_PARTICLEFX)
{
     ppsvalue = 1000.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1 1 1";
     ppsfps = 3.000000000;
     shptype_s = "MESH";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "-35 0 20";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.000300000;
     shpisvolume = 1;
     shpdim_s = "1";
     shpmesh_s = "TELEPORT_AURA.3ds";
     shpscalekeys_s = "1";
     shpscalefps = 5.000000000;
     dirmode_s = "DIR";
     dirfor_s = "WORLD";
     lsppartavg = 800.000000000;
     lsppartvar = 100.000000000;
     visname_s = "TELSTURM.TGA";
     vistexcolorstart_s = "0 200 255";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "10 10";
     vissizeendscale = 4.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};


///   													XXXXXXXXXXXXXXXXXXXXXXX
///   													XX  S P A W N   F X  XX
///   													XXXXXXXXXXXXXXXXXXXXXXX


INSTANCE MFX_SPAWN_CAST (C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
     ppsscalekeys_s = "1";
     ppsfps = 1.000000000;
     ppscreateem_s = "MFX_SPAWN_CHILD";
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 15 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.000300000;
     shpisvolume = 1;
     shpdim_s = "50";
     shpscalekeys_s = "1 0.3 1.2 0.8.0.1 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 5.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     velavg = 0.001000000;
     lsppartavg = 1000.000000000;
     visname_s = "MFX_LIGHT_SINGLERAY.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexcolorstart_s = "0 100 255";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "20 200";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "ADD";
     visalphaend = 255.000000000;
};


INSTANCE MFX_SPAWN_CHILD (C_PARTICLEFX)
{
     ppsvalue = 50.000000000;
     ppsscalekeys_s = "1";
     ppsfps = 1.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 15 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.000300000;
     shpdim_s = "30";
     shpscalekeys_s = "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20";
     shpscaleislooping = 1;
     shpscalefps = 20.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     velavg = 0.010000000;
     lsppartavg = 500.000000000;
     visname_s = "MFX_LIGHT_SINGLERAY.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexcolorstart_s = "0 100 255";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "10 100";
     vissizeendscale = 5.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

///   													XXXXXXXXXXXXXXXXX
///   													XX  L I G H T  XX
///   													XXXXXXXXXXXXXXXXX


INSTANCE MFX_LIGHT_INIT (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsfps = 0.020000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 15 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.000300000;
     shpisvolume = 1;
     shpdim_s = "15";
     shpscalekeys_s = "1 0.3 1.2 0.8.0.1 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 5.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     velavg = 0.001000000;
     lsppartavg = 150.000000000;
     visname_s = "MFX_LIGHT_SINGLERAY.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "3 20";
     vissizeendscale = 3.000000000;
     visalphafunc_s = "ADD";
     visalphaend = 255.000000000;
};

INSTANCE MFX_LIGHT_ORIGIN (C_PARTICLEFX)
{
     ppsvalue = 250.000000000;
     //60 scalekeys:
     ppsscalekeys_s = "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0.9 0.8 0.7 0.6 0.5 0.4 0.3 0.2 0.1";
     ppsfps = 0.2;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.000300000;
     shpisvolume = 1;
     shpdim_s = "15";
     shpscalekeys_s = "1 0.3 1.2 0.8.0.1 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 5.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     velavg = 0.001000000;
     lsppartavg = 300.000000000;
     lsppartvar = 100.000000000;
     visname_s = "MFX_LIGHT_SINGLERAY.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "3 30";
     vissizeendscale = 5.000000000;
     visalphafunc_s = "ADD";
     visalphaend = 255.000000000;
     useemittersfor = 1;
};

INSTANCE MFX_PALLIGHT_INIT (C_PARTICLEFX)
{
     ppsvalue = 30;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "30";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleissmooth = 1;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 0.00999999978;
     lsppartavg = 1000;
     lsppartvar = 100;
     flygravity_s = "0 0 0";
     visname_s = "HEAVENLIGHT.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "2 10";
     vissizeendscale = 5;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     useemittersfor = 1;
};

INSTANCE MFX_PALLIGHT_ORIGIN (C_PARTICLEFX)
{
     ppsvalue = 50;
     ppsscalekeys_s = "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0.9 0.8 0.7 0.6 0.5 0.4 0.3 0.2 0.1";
     ppsfps = 0.200000003;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "30";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleissmooth = 1;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 0.00999999978;
     lsppartavg = 1000;
     lsppartvar = 100;
     flygravity_s = "0 0 0";
     visname_s = "HEAVENLIGHT.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 100 100";
     vistexcolorend_s = "100 255 255";
     vissizestart_s = "5 30";
     vissizeendscale = 5;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     useemittersfor = 1;
};

///   													XXXXXXXXXXXXXXXXXXXXXXX
///   													XX  F I R E B O L T  XX
///   													XXXXXXXXXXXXXXXXXXXXXXX

INSTANCE MFX_FIREBOLT_INIT (C_PARTICLEFX)
{
     ppsvalue = 500.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 7 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "7";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.003000000;
     velvar = 0.001000000;
     lsppartavg = 150.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 200 150";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "2 2";
     vissizeendscale = 8.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE MFX_FIREBOLT_CAST (C_PARTICLEFX)
{
     ppsvalue = 200;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1;
     shptype_s = "SPHERE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "20 5 5";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.100000001;
     shpisvolume = 1;
     shpdim_s = "5";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 9.99999975e-006;
     lsppartavg = 500;
     flygravity_s = "0 0 0";
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "VELO";
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 200 200";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "5 5";
     vissizeendscale = 2;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     trlfadespeed = 0.5;
     trltexture_s = "MFX_FIRERAIN_RAIN_BIG.TGA";
     trlwidth = 5;
     useemittersfor = 1;
};

INSTANCE MFX_FIREBOLT_COLLIDE (C_PARTICLEFX)
{
     ppsvalue = 30.000000000;
     ppsfps = 10.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "8";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.079999998;
     velvar = 0.020000000;
     lsppartavg = 1000.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 1;
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 220 220";
     vistexcolorend_s = "255 220 220";
     vissizestart_s = "10 10";
     vissizeendscale = 8.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

///   													XXXXXXXXXXXXXXXXXXXXXXX
///   													XX  F I R E B A L L  XX
///  search keyword: #ifb								XXXXXXXXXXXXXXXXXXXXXXX
///   													XX  I N S T A N T    XX
///   													XXXXXXXXXXXXXXXXXXXXXXX


INSTANCE MFX_IFB_CAST (C_PARTICLEFX)
{
     ppsvalue = 20;
     ppsscalekeys_s = "5";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "14";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 0.00800000038;
     velvar = 0.0299999993;
     lsppartavg = 500;
     flygravity_s = "0 0 0";
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "VELO3D";
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 200 200";
     vistexcolorend_s = "200 150 0";
     vissizestart_s = "25 25";
     vissizeendscale = 3;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     trlfadespeed = 0.400000006;
     trltexture_s = "FIRETRAIL.TGA";
     trlwidth = 5;
     useemittersfor = 1;
};

INSTANCE MFX_IFB_PFXTRAIL (C_PARTICLEFX)
{
     ppsvalue = 5;
     ppsscalekeys_s = "5";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "20";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 0.00800000038;
     velvar = 0.0299999993;
     lsppartavg = 700;
     flygravity_s = "0 0.0003 0";
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 200 200";
     vistexcolorend_s = "200 150 0";
     vissizestart_s = "25 25";
     vissizeendscale = 3;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     trltexture_s = "FIRETRAIL.TGA";
};


///   													XXXXXXXXXXXXXXXXXXXXXXX
///   													XX  F I R E B A L L  XX
///   													XXXXXXXXXXXXXXXXXXXXXXX
///   													XX    C H A R G E    XX
///   													XXXXXXXXXXXXXXXXXXXXXXX


PROTOTYPE MFX_CHARGEFB (C_PARTICLEFX)
{
     ppsvalue = 50;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "30";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "world";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 9.99999975e-006;
     lsppartavg = 500;
     flygravity_s = "0 0 0";
     visname_s = "MFX_FIREBALL.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "200 200 255";
     vistexcolorend_s = "200 200 255";
     vissizestart_s = "15 15";
     vissizeendscale = 5;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     //useemittersfor = 1;
};

INSTANCE MFX_CHARGEFB_CAST   (MFX_CHARGEFB)
{
	vissizestart_s = "10 10";
	visalphastart = 180;
};

INSTANCE MFX_CHARGEFB_CAST_L2   (MFX_CHARGEFB)
{
	vissizestart_s = "15 15";
	visalphastart = 210;
};

INSTANCE MFX_CHARGEFB_CAST_L3   (MFX_CHARGEFB)
{
	vissizestart_s = "20 20";
	visalphastart = 230;
};

INSTANCE MFX_CHARGEFB_CAST_L4   (MFX_CHARGEFB)
{
	vissizestart_s = "25 25";
	visalphastart = 255;
};

INSTANCE MFX_CHARGEFB_CAST_L5   (MFX_CHARGEFB)
{
	vissizestart_s = "30 30";
	visalphastart = 255;
};


INSTANCE MFX_CHARGEFB_INVEST	(C_PARTICLEFX)
{
     ppsvalue = 20;
     ppsscalekeys_s = "5";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "100";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "TARGET";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 0.0500000007;
     velvar = 0.0299999993;
     lsppartavg = 2000;
     flygravity_s = "0 0 0";
     visname_s = "MFX_FIREBALL.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 2;
     vistexcolorstart_s = "255 200 200";
     vistexcolorend_s = "200 150 0";
     vissizestart_s = "50 50";
     vissizeendscale = 0.00100000005;
     visalphafunc_s = "ADD";
     visalphastart = 255;
};



INSTANCE MFX_CHARGEFB_INVESTBLAST (C_PARTICLEFX)
{
     ppsvalue = 10;
     ppsscalekeys_s = "2";
     ppsissmooth = 1;
     ppsfps = 2;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "100";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 9.99999975e-005;
     lsppartavg = 1000;
     flygravity_s = "0 0 0";
     visname_s = "MFX_FIREBALL2.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 200 200";
     vistexcolorend_s = "200 150 0";
     vissizestart_s = "10 10";
     vissizeendscale = 6;
     visalphafunc_s = "ADD";
     visalphastart = 255;
};

INSTANCE MFX_CHARGEFB_COLLIDE (C_PARTICLEFX)
{
     ppsvalue = 40;
     ppsscalekeys_s = "1";
     ppsfps = 10;
     //ppscreateem_s = "MFX_FIREBALL_COLLIDE_WALLGLOW";
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "8";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 0.0799999982;
     velvar = 0.0199999996;
     lsppartavg = 600;
     lsppartvar = 200;
     flygravity_s = "0 0.0001 0";
     flycolldet_b = 1;
     visname_s = "MFX_FIREBALL.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 220 220";
     vistexcolorend_s = "255 220 220";
     vissizestart_s = "20 20";
     vissizeendscale = 4;
     visalphafunc_s = "ADD";
     visalphastart = 255;
};

///   													XXXXXXXXXXXXXXXXXXXXXXX
///   													XX  F I R E B A L L  XX
///   													XXXXXXXXXXXXXXXXXXXXXXX

INSTANCE MFX_FIREBALL_INIT (C_PARTICLEFX)
{
     ppsvalue = 80.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 7 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 7 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.001000000;
     lsppartavg = 300.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "8 8";
     vissizeendscale = 8.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE MFX_FIREBALL_INVEST_BLAST (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1 1 2 2 2 3 3 3 4 4 4 3 3 3 2 2 2 1 1";
     ppsissmooth = 1;
     ppsfps = 25.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "6";
     shpscalekeys_s = "1 2 3 4 5 6 7 8 9 10 9 8 7 6 5 4 3 2 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 25.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.001000000;
     lsppartavg = 200.000000000;
     lsppartvar = 50.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 1;
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "10 10";
     vissizeendscale = 6.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

PROTOTYPE MFX_FIREBALL_INVEST_PROTO (C_PARTICLEFX)
{
     ppsvalue = 20.000000000;
     ppsscalekeys_s = "3 2 1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "20";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.008000000;
     velvar = 0.029999999;
     lsppartavg = 2000.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 220 220";
     vistexcolorend_s = "255 220 220";
     vissizestart_s = "10 10";
     vissizeendscale = 8.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 100.000000000;
};



INSTANCE MFX_FIREBALL_INVEST	(MFX_FIREBALL_INVEST_PROTO)
{
	 ppsvalue = 10;
	 lsppartavg = 1000.000000000;
	 vistexcolorstart_s = "200 50 50";
	 vistexcolorend_s = "200 0 0";
     vissizeendscale = 5.000000000;
     shpdim_s = "6";
     visalphastart = 180;
};

INSTANCE MFX_FIREBALL_INVEST_L1 (MFX_FIREBALL_INVEST_PROTO)
{
	 ppsvalue = 10;
	 lsppartavg = 1000.000000000;
	 vistexcolorstart_s = "200 100 100";
     vistexcolorend_s = "200 50 50";
     vissizeendscale = 5.000000000;
     shpdim_s = "6";
     visalphastart = 180;
};

INSTANCE MFX_FIREBALL_INVEST_L2 (MFX_FIREBALL_INVEST_PROTO)
{
	 ppsvalue = 13;
	 lsppartavg = 1300.000000000;
	 vistexcolorstart_s = "220 150 150";
     vistexcolorend_s = "220 100 100";
     vissizeendscale = 6.000000000;
     shpdim_s = "14";
     visalphastart = 200;
};

INSTANCE MFX_FIREBALL_INVEST_L3 (MFX_FIREBALL_INVEST_PROTO)
{
	 ppsvalue = 16;
	 lsppartavg = 1600.000000000;
	 vistexcolorstart_s = "235 200 200";
     vistexcolorend_s = "235 150 150";
     vissizeendscale = 7.000000000;
     shpdim_s = "22";
     visalphastart = 220;
};

INSTANCE MFX_FIREBALL_INVEST_L4 (MFX_FIREBALL_INVEST_PROTO)
{
	 ppsvalue = 20;
	 lsppartavg = 2000.000000000;
	 vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 200 200";
     vissizeendscale = 8.000000000;
     shpdim_s = "30";
     visalphastart = 255;
};



PROTOTYPE MFX_FIREBALL_CAST_PROTO (C_PARTICLEFX)
{
     ppsvalue = 400.000000000;
     ppsscalekeys_s = "5";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "30";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "world";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.008000000;
     velvar = 0.029999999;
     lsppartavg = 200.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 200 200";
     vistexcolorend_s = "200 150 0";
     vissizestart_s = "15 15";
     vissizeendscale = 3.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE MFX_FIREBALL_CAST (MFX_FIREBALL_CAST_PROTO)
{
	 vistexcolorstart_s = "200 100 100";
     vistexcolorend_s = "200 0 0";
     vissizeendscale = 1.000000000;
     lsppartavg = 200.000000000;
     shpdim_s = "10";
     visalphastart = 180;
};

INSTANCE MFX_FIREBALL_CAST_L1 (MFX_FIREBALL_CAST_PROTO)
{
     ppsvalue = 400.000000000;
     ppsscalekeys_s = "5";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.008000000;
     velvar = 0.029999999;
     lsppartavg = 200.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 30 30";
     vistexcolorend_s = "200 0 0";
     vissizestart_s = "15 15";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 180.000000000;
};

INSTANCE MFX_FIREBALL_CAST_L2 (MFX_FIREBALL_CAST_PROTO)
{
     ppsvalue = 400.000000000;
     ppsscalekeys_s = "5";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "20";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.008000000;
     velvar = 0.029999999;
     lsppartavg = 300.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 60 60";
     vistexcolorend_s = "220 0 0";
     vissizestart_s = "15 15";
     vissizeendscale = 2.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 200.000000000;
};

INSTANCE MFX_FIREBALL_CAST_L3 (MFX_FIREBALL_CAST_PROTO)
{
     ppsvalue = 400.000000000;
     ppsscalekeys_s = "5";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "30";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.008000000;
     velvar = 0.029999999;
     lsppartavg = 400.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 230 230";
     vistexcolorend_s = "235 0 0";
     vissizestart_s = "15 15";
     vissizeendscale = 2.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 220.000000000;
};

INSTANCE MFX_FIREBALL_CAST_L4 (MFX_FIREBALL_CAST_PROTO)
{
     ppsvalue = 400.000000000;
     ppsscalekeys_s = "5";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "40";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.008000000;
     velvar = 0.029999999;
     lsppartavg = 500.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 220 220";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "15 15";
     vissizeendscale = 3.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

PROTOTYPE MFX_FIREBALL_COLLIDE_PROTO (C_PARTICLEFX)
{
     ppsvalue = 40.000000000;
     ppsfps = 10.000000000;
     ppscreateem_s = "MFX_FIREBALL_COLLIDE_WALLGLOW";
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "8";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.079999998;
     velvar = 0.020000000;
     lsppartavg = 2000.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 1;
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 220 220";
     vistexcolorend_s = "255 220 220";
     vissizestart_s = "10 10";
     vissizeendscale = 15.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};


INSTANCE MFX_FIREBALL_COLLIDE1	 (MFX_FIREBALL_COLLIDE_PROTO)
{
     ppsvalue = 10.000000000;
     lsppartavg = 1400.000000000;
     vissizeendscale = 10.000000000;
     visalphastart = 130.000000000;
};

INSTANCE MFX_FIREBALL_COLLIDE2	 (MFX_FIREBALL_COLLIDE_PROTO)
{
     ppsvalue = 20.000000000;
     lsppartavg = 1600.000000000;
     vissizeendscale = 12.0000000;
     visalphastart = 180.000000000;
};

INSTANCE MFX_FIREBALL_COLLIDE3	 (MFX_FIREBALL_COLLIDE_PROTO)
{
     ppsvalue = 30.000000000;
     lsppartavg = 1800.000000000;
     vissizeendscale = 14.000000000;
     visalphastart = 220.000000000;
     ppscreateem_s = "MFX_FIREBALL_COLLIDE_SPARKS";
};

INSTANCE MFX_FIREBALL_COLLIDE4	 (MFX_FIREBALL_COLLIDE_PROTO)
{
     ppsvalue = 40.000000000;
     lsppartavg = 2000.000000000;
     vissizeendscale = 16.000000000;
     visalphastart = 255.000000000;
     ppscreateem_s = "MFX_FIREBALL_COLLIDE_SPARKS";
};


INSTANCE MFX_FIREBALL_COLLIDE_SPARKS (C_PARTICLEFX)
{
     ppsvalue = 600.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "POINT";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "50";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.200000003;
     velvar = 0.050000001;
     lsppartavg = 5000.000000000;
     flygravity_s = "0 -0.0005 0";
     flycolldet_b = 1;
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 220 0";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "30 30";
     vissizeendscale = 0.100000001;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};


INSTANCE MFX_FIREBALL_COLLIDE_WALLGLOW (C_PARTICLEFX)
{
     ppsvalue = 3.000000000;
     ppsscalekeys_s = "5 5 4 4 3 3 2 2 1 1";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "50";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     lsppartavg = 1500.000000000;
     flygravity_s = "0 0.00004 0";
     flycolldet_b = 1;
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 220 220";
     vistexcolorend_s = "255 220 220";
     vissizestart_s = "2 2";
     vissizeendscale = 20.000000000;
     visalphafunc_s = "ADD";
};



///   													XXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  F I R E S T O R M  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE MFX_FIRESTORM_INIT (C_PARTICLEFX)
{
     ppsvalue = 150.000000000;
     ppsscalekeys_s = "5";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.100000001;
     shpisvolume = 1;
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.008000000;
     velvar = 0.029999999;
     lsppartavg = 500.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "VELO";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 200 200";
     vistexcolorend_s = "255 100 0";
     vissizestart_s = "6 6";
     vissizeendscale = 6.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE MFX_FIRESTORM_INVESTBLAST1 (C_PARTICLEFX)
{
     ppsvalue = 600.000000000;
     ppsscalekeys_s = "1 2 3 2";
     ppsissmooth = 1;
     ppsfps = 6.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.100000001;
     shpdim_s = "10";
     shpscalekeys_s = "1 2 3 2";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 6.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.010000000;
     velvar = 0.029999999;
     lsppartavg = 150.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "VELO";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 220 100";
     vistexcolorend_s = "255 50 50";
     vissizestart_s = "5 5";
     vissizeendscale = 8.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE MFX_FIRESTORM_INVESTBLAST2 (C_PARTICLEFX)
{
     ppsvalue = 600.000000000;
     ppsscalekeys_s = "1 2 4 2";
     ppsissmooth = 1;
     ppsfps = 6.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.100000001;
     shpdim_s = "10";
     shpscalekeys_s = "1 2 4 2";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 6.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.010000000;
     velvar = 0.029999999;
     lsppartavg = 150.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "VELO";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 220 100";
     vistexcolorend_s = "255 50 50";
     vissizestart_s = "5 5";
     vissizeendscale = 8.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE MFX_FIRESTORM_INVESTBLAST3 (C_PARTICLEFX)
{
     ppsvalue = 600.000000000;
     ppsscalekeys_s = "1 3 5 3";
     ppsissmooth = 1;
     ppsfps = 6.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.100000001;
     shpdim_s = "10";
     shpscalekeys_s = "1 3 5 3";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 6.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.010000000;
     velvar = 0.029999999;
     lsppartavg = 150.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "VELO";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 220 100";
     vistexcolorend_s = "255 50 50";
     vissizestart_s = "5 5";
     vissizeendscale = 8.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE MFX_FIRESTORM_INVESTBLAST4 (C_PARTICLEFX)
{
     ppsvalue = 600.000000000;
     ppsscalekeys_s = "1 4 6 4";
     ppsissmooth = 1;
     ppsfps = 6.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.100000001;
     shpdim_s = "10";
     shpscalekeys_s = "1 4 6 4";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 6.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.010000000;
     velvar = 0.029999999;
     lsppartavg = 150.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "VELO";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 220 100";
     vistexcolorend_s = "255 50 50";
     vissizestart_s = "5 5";
     vissizeendscale = 8.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};



INSTANCE MFX_FIRESTORM_CAST (C_PARTICLEFX)
{
     ppsvalue = 300.000000000;
     ppsscalekeys_s = "5";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.100000001;
     shpisvolume = 1;
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.008000000;
     velvar = 0.029999999;
     lsppartavg = 500.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "VELO";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 200 200";
     vistexcolorend_s = "255 100 0";
     vissizestart_s = "6 6";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE MFX_FIRESTORM_SPREAD (C_PARTICLEFX)
{
     ppsvalue = 400;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 10;
     shptype_s = "SPHERE";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.100000001;
     shpisvolume = 1;
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 50;
     dirangleelevvar = 180;
     velavg = 0.289999992;
     velvar = 0.0299999993;
     lsppartavg = 1000;
     flygravity_s = "0 0 0";
     visname_s = "MFX_FIRERAIN_RAIN.TGA";
     visorientation_s = "VELO3D";
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 200 200";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 100";
     vissizeendscale = 0.100000001;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     trlfadespeed = 1.5;
     trltexture_s = "MFX_FIRERAIN_RAINTRAIL.TGA";
     trlwidth = 8;
};

INSTANCE MFX_FIRESTORM_SPREAD_SMALL (C_PARTICLEFX)
{
     ppsvalue = 400;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 10;
     shptype_s = "SPHERE";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.100000001;
     shpisvolume = 1;
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "DIR";
     dirfor_s = "WORLD";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 50;
     dirangleelevvar = 180;
     velavg = 0.270000011;
     lsppartavg = 1000;
     flygravity_s = "0 0 0";
     visname_s = "MFX_FIRERAIN_RAIN.TGA";
     visorientation_s = "VELO3D";
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 200 200";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 100";
     vissizeendscale = 0.100000001;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     trlfadespeed = 1.5;
     trltexture_s = "MFX_FIRERAIN_RAINTRAIL.TGA";
     trlwidth = 8;
};


///   													XXXXXXXXXXXXXXXXXXXXXXX
///   													XX  F I R E R A I N  XX
///   													XXXXXXXXXXXXXXXXXXXXXXX


INSTANCE MFX_FIRERAIN_INIT (C_PARTICLEFX)
{
     ppsvalue = 50.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 20 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "5";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 40.000000000;
     dirangleelev = -89.000000000;
     velavg = 0.000100000;
     lsppartavg = 100.000000000;
     lsppartvar = 0.000000000;
     flygravity_s = "0 -0.003 0";
     visname_s = "MFX_FIRERAIN_RAIN.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "200 100 0";
     vistexcolorend_s = "200 200 0";
     vissizestart_s = "2 5";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

INSTANCE MFX_FIRERAIN_INVESTGLOW (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "BOX";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "100 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "10 1000 10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleelev = -89.000000000;
     velavg = 0.001000000;
     lsppartavg = 800.000000000;
     lsppartvar = 100.000000000;
     flygravity_s = "0 0.001 0";
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "10 50";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};



INSTANCE MFX_FIRERAIN_RAIN (C_PARTICLEFX)
{
     ppsvalue = 80.000000000;
     ppsscalekeys_s = "1 1 1 1 1 0.8 0.7 0.6 0.5 0.4 0.3 0.2 0.1";
     ppsfps = 2.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 1000 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "1000";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscalefps = 15.000000000;
     dirmode_s = "DIR";
     dirfor_s = "WORLD";
     diranglehead = 10.000000000;
     dirangleheadvar = 5.000000000;
     dirangleelev = -90.000000000;
     dirangleelevvar = 5.000000000;
     velavg = 0.699999988;
     velvar = 0.300000012;
     lsppartavg = 2000.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 -0.0005 0";
     visname_s = "MFX_FIRERAIN_RAIN_BIG.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 10.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "10 60";
     vissizeendscale = 3.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
     trlfadespeed = 0.699999988;
     trltexture_s = "MFX_FIRERAIN_RAINTRAIL.TGA";
     trlwidth = 8.000000000;
};

INSTANCE MFX_FIRERAIN_GROUND (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1 0.8 0.6 0.4 0.2";
     ppsfps = 2.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 -120 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "1000";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscalefps = 15.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     diranglehead = 90.000000000;
     dirangleelev = 90.000000000;
     velavg = 0.029999999;
     lsppartavg = 2000.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 3;
     visname_s = "FIRE_COMPLETE_A1.TGA";
     visorientation_s = "0";
     vistexisquadpoly = 1;
     vistexanifps = 3.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "20 0 0";
     vissizestart_s = "50 10";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "ADD";
     visalphaend = 255.000000000;
     trltexture_s = "MFX_FIRERAIN_RAINTRAIL.TGA";
     mrktexture_s = "=";
};

INSTANCE MFX_FIRERAIN_TARGET (C_PARTICLEFX)
{
     ppsvalue = 10.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1 1 1 0.8 0.8 0.8 0.6 0.6 0.3";
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 -100 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscalefps = 15.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     diranglehead = 90.000000000;
     dirangleheadvar = 45.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 45.000000000;
     velavg = 0.000100000;
     lsppartavg = 2500.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 0.0001 0";
     visname_s = "WHITECLOUD.TGA";
     visorientation_s = "NONE";
     vistexanifps = 25.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "200 100 0";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "100 200";
     vissizeendscale = 2.000000000;
     visalphafunc_s = "ADD";
     visalphaend = 255.000000000;
     trltexture_s = "LIGHTNING_BIG_A0.TGA";
};



///   													XXXXXXXXXXXXXXXXX
///   													XX  S P E E D  XX
///   													XXXXXXXXXXXXXXXXX


INSTANCE MFX_SPEED_FOOTSTEPS (C_PARTICLEFX)
{
     ppsvalue = 10.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "8";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     diranglehead = 180.000000000;
     dirangleheadvar = 1.000000000;
     velavg = 0.010000000;
     lsppartavg = 1000.000000000;
     flygravity_s = "0 0.0002 0";
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 150 255";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "20 20";
     vissizeendscale = 5.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     trlfadespeed = 0.100000001;
     trltexture_s = "WHITECLOUD.TGA";
};


///   													XXXXXXXXXXXXXXXXXXXXXXX
///   													XX  T E L E P O R T  XX
///   													XXXXXXXXXXXXXXXXXXXXXXX


INSTANCE MFX_TELEPORT_INIT (C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 5.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "OBJECT";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 0.000300000;
     shpdim_s = "15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     velavg = 0.050000001;
     lsppartavg = 800.000000000;
     lsppartvar = 100.000000000;
     visname_s = "TELSTURM.TGA";
     visorientation_s = "NONE";
     vistexcolorstart_s = "100 255 255";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "5 5";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE MFX_TELEPORT_INVEST (C_PARTICLEFX)
{
     ppsvalue = 1000.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 5.000000000;
     shptype_s = "MESH";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "-35 0 20";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.000300000;
     shpisvolume = 1;
     shpdim_s = "1";
     shpmesh_s = "TELEPORT_AURA.3ds";
     shpscalekeys_s = "1";
     shpscalefps = 5.000000000;
     dirmode_s = "DIR";
     dirfor_s = "WORLD";
     lsppartavg = 800.000000000;
     lsppartvar = 100.000000000;
     visname_s = "TELSTURM.TGA";
     vistexcolorstart_s = "0 200 255";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "10 10";
     vissizeendscale = 4.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};


INSTANCE MFX_TELEPORT_RING (C_PARTICLEFX)
{
     ppsvalue = 1000.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     ppscreateem_s = "=";
     shptype_s = "CIRCLE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 -100 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.000300000;
     shpdim_s = "100";
     shpscalekeys_s = "1";
     shpscalefps = 5.000000000;
     dirmode_s = "DIR";
     dirfor_s = "WORLD";
     lsppartavg = 3000.000000000;
     lsppartvar = 100.000000000;
     flygravity_s = "0 0.0001 0";
     visname_s = "LIGHTNING_BIG_A0.TGA";
     vistexcolorstart_s = "0 0 0";
     vistexcolorend_s = "0 100 255";
     vissizestart_s = "40 40";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE MFX_TELEPORT_CAST (C_PARTICLEFX)
{
     ppsvalue = 2000.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "MESH";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "-30 0 30";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.000300000;
     shpisvolume = 1;
     shpdim_s = "1";
     shpmesh_s = "TELEPORT_AURA.3ds";
     shpscalekeys_s = "1";
     shpscalefps = 5.000000000;
     dirmode_s = "RAND";
     dirfor_s = "WORLD";
     velavg = 0.090000004;
     lsppartavg = 600.000000000;
     lsppartvar = 500.000000000;
     flygravity_s = "0 0.0001 0";
     visname_s = "TELSTURM.TGA";
     vistexcolorstart_s = "0 200 255";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "10 10";
     vissizeendscale = 20.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     trltexture_s = "LIGHTNING_BIG_A0.TGA";
};


///   													XXXXXXXXXXXXXXX
///   													XX  H E A L  XX
///   													XXXXXXXXXXXXXXX

INSTANCE MFX_HEAL_INIT (C_PARTICLEFX)
{
     ppsvalue = 50.000000000;
     ppsislooping = 1;
     ppsissmooth = 0;
     ppsfps = 5.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "world";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.000300000;
     shpdim_s = "6";
     shpscalekeys_s = "2 1.5 2";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1.000000000;
     dirmode_s = "DIR";
     dirfor_s = "WORLD";
     lsppartavg = 500.000000000;
     visname_s = "TELSTURM.TGA";
     vistexcolorstart_s = "50 150 255";
     vistexcolorend_s = "50 0 255";
     vissizestart_s = "10 10";
     vissizeendscale = 5.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 140.000000000;
};

INSTANCE MFX_HEAL_CAST (C_PARTICLEFX)
{
     ppsvalue = 10;
     ppsscalekeys_s = "1 1 1 1 1";
     ppsfps = 2;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "3";
     shpmeshrender_b = 1;
     shpscalekeys_s = "300 1";
     shpscalefps = 10;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     lsppartavg = 5000;
     flygravity_s = "0 0.0001 0";
     visname_s = "HEAVENLIGHT.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "50 150 255";
     vistexcolorend_s = "50 0 255";
     vissizestart_s = "2 10";
     vissizeendscale = 25;
     visalphafunc_s = "ADD";
     visalphastart = 255;
};

INSTANCE MFX_HEAL_HEAVENLIGHT (C_PARTICLEFX)
{
     ppsvalue = 20;
     ppsscalekeys_s = "1 1 1";
     ppsissmooth = 1;
     ppsfps = 1;
     shptype_s = "CIRCLE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 400 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1 2 3 4 5 6 7";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 5;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 9.99999975e-005;
     lsppartavg = 5000;
     flygravity_s = "0 -0.0001 0";
     visname_s = "HEAVENLIGHT.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "50 150 255";
     vistexcolorend_s = "50 0 255";
     vissizestart_s = "32 128";
     vissizeendscale = 2;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     useEmittersFOR = 1;
};


///   													XXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  T R A N S F O R M    XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXX


INSTANCE MFX_TRANSFORM_INIT (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 5.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     diranglehead = 90.000000000;
     dirangleheadvar = 45.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 45.000000000;
     velavg = 0.150000006;
     velvar = 0.200000003;
     lsppartavg = 300.000000000;
     flygravity_s = "0 0 0";
     visname_s = "WAVEOFINSANITY_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "1 1";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 20.000000000;
     trlfadespeed = 0.200000003;
     trltexture_s = "LIGHTNING_BIG_A0.TGA";
     trlwidth = 2.000000000;
};

INSTANCE MFX_TRANSFORM_GLOW (C_PARTICLEFX)
{
     ppsvalue = 800.000000000;
     ppsscalekeys_s = "1 1 1 1 0.8 0.6 0.4 0.2";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "150";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     diranglehead = 90.000000000;
     dirangleheadvar = 45.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 45.000000000;
     velavg = 0.001000000;
     lsppartavg = 500.000000000;
     flygravity_s = "0 0 0";
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 128 255";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "10 10";
     vissizeendscale = 12.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 200.000000000;
     trltexture_s = "LIGHTNING_BIG_A0.TGA";
};

INSTANCE MFX_TRANSFORM_BLEND (C_PARTICLEFX)
{
     ppsvalue = 1000;
     ppsscalekeys_s = "1 1";
     ppsissmooth = 1;
     ppsfps = 5;
     shptype_s = "SPHERE";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "300";
     shpscalekeys_s = "1";
     dirmode_s = "TARGET";
     dirfor_s = "WORLD";
     dirmodetargetfor_s = "OBJECT";
     diranglehead = 90;
     dirangleheadvar = 45;
     dirangleelev = 90;
     velavg = 1;
     lsppartavg = 1000;
     flygravity_s = "0 0 0";
     visname_s = "HEAVENLIGHT.TGA";
     visorientation_s = "VELO3D";
     vistexanifps = 5;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "5 50";
     vissizeendscale = 5;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     trltexture_s = "LIGHTNING_BIG_A0.TGA";
};

/*INSTANCE MFX_TRANSFORM_ORIGIN (C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
     ppsscalekeys_s = "1 1 1 1 2 2 3 3 4 4";
     ppsissmooth = 1;
     ppsislooping = 1;
     ppsfps = 2.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     diranglehead = 90.000000000;
     dirangleheadvar = 45.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 45.000000000;
     velavg = 0.600000024;
     velvar = 0.200000003;
     lsppartavg = 400.000000000;
     lsppartvar = 200.000000000;
     flygravity_s = "0 0 0";
     visname_s = "WAVEOFINSANITY_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "1 1";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 20.000000000;
     trlfadespeed = 0.200000003;
     trltexture_s = "LIGHTNING_BIG_A0.TGA";
     trlwidth = 3.000000000;
};*/

INSTANCE MFX_TRANSFORM_ORIGIN (C_PARTICLEFX)
{
     ppsvalue = 100;
     ppsscalekeys_s = "1 1 1 1 1";
     ppsissmooth = 1;
     ppsfps = 5;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "UNIFORM";
     shpdim_s = "10";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleissmooth = 1;
     dirmode_s = "RAND";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 0.00999999978;
     lsppartavg = 2000;
     lsppartvar = 100;
     flygravity_s = "0 0 0";
     visname_s = "HEAVENLIGHT.TGA";
     visorientation_s = "VELO3D";
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "50 150 255";
     vistexcolorend_s = "50 0 255";
     vissizestart_s = "1 50";
     vissizeendscale = 30;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     useemittersfor = 1;
};



///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  T R A N S F O R M    ( S P E C I E S )  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX


///   													XXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  L I G H T N I N G  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXX


INSTANCE MFX_LIGHTNING_ORIGIN (C_PARTICLEFX)
{
     ppsvalue = 10;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "POINT";
     shpscalekeys_s = "1 2 1 2";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 0.5;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 0.00100000005;
     lsppartavg = 200;
     flygravity_s = "0 0 0";
     visname_s = "LIGHTNING_ORIGIN_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 25;
     vistexaniislooping = 1;
     vistexcolorstart_s = "200 255 255";
     vistexcolorend_s = "0 100 255";
     vissizestart_s = "15 15";
     vissizeendscale = 2;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     visalphaend = 255;
     useemittersfor = 1;
};

INSTANCE MFX_LIGHTNING_TARGET (C_PARTICLEFX)
{
     ppsvalue = 25.000000000;
     ppsscalekeys_s = "1 2 1 0.7 0.4 0.1";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     ppsIsLooping =1;
     shptype_s = "LINE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "60";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.001000000;
     velvar = 0.000100000;
     lsppartavg = 500.000000000;
     flygravity_s = "0 0 0";
     visname_s = "LIGHTNING_BIG_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 10.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 190 255";
     vistexcolorend_s = "0 0 150";
     vissizestart_s = "10 10";
     vissizeendscale = 4.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 150.000000000;
};

INSTANCE MFX_LIGHTNINGFLASH_TARGET (C_PARTICLEFX)
{
     ppsvalue = 20;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsfps = 1;
     shptype_s = "POINT";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "150";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 0.00999999978;
     lsppartavg = 75;
     flygravity_s = "0 0 0";
     visname_s = "LIGHTNING_ORIGIN_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 20;
     vistexaniislooping = 1;
     vistexcolorstart_s = "100 200 255";
     vistexcolorend_s = "200 200 255";
     vissizestart_s = "200 200";
     vissizeendscale = 1;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     visalphaend = 255;
};

///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  H E A V E N S   R A G E        XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX


INSTANCE MFX_HEAVENSRAGE_CAST (C_PARTICLEFX)
{
     ppsvalue = 10;
     ppsscalekeys_s = "5";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.100000001;
     shpisvolume = 1;
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 3;
     velavg = 0.100000001;
     velvar = 0.0299999993;
     lsppartavg = 100;
     flygravity_s = "0 0 0";
     visname_s = "LIGHTNINGNEU_BIG_A0.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 5;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "2 10";
     vissizeendscale = 20;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     visalphaend = 255;
};


INSTANCE MFX_HEAVENSRAGE_FLASH (C_PARTICLEFX)
{
     ppsvalue = 10;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 1;
     ppscreateem_s = "MFX_HEAVENSRAGE_FLASHORIGIN";
     shptype_s = "POINT";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 400 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "5";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 5;
     dirmode_s = "DIR";
     dirfor_s = "WORLD";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleelev = 90;
     velavg = 0.00100000005;
     lsppartavg = 200;
     flygravity_s = "0 -0.0000001 0";
     visname_s = "LIGHTNINGNEU_BIG_A0.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 20;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "100 500";
     vissizeendscale = 1;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     useemittersfor = 1;
};

INSTANCE MFX_HEAVENSRAGE_FLASHORIGIN (C_PARTICLEFX)
{
     ppsvalue = 30;
     ppsscalekeys_s = "1 1";
     ppsissmooth = 1;
     ppsfps = 1;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 850 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "300";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 0.600000024;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 0.00999999978;
     velvar = 9.99999975e-005;
     lsppartavg = 300;
     flygravity_s = "0 0 0";
     visname_s = "LIGHTNING_ORIGIN_A0.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "50 150 255";
     vistexcolorend_s = "50 0 255";
     vissizestart_s = "50 50";
     vissizeendscale = 3;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     trltexture_s = "WHITECLOUD.TGA";
     useemittersfor = 1;
};

INSTANCE MFX_HEAVENSRAGE_TARGET (C_PARTICLEFX)
{
     ppsvalue = 20;
     ppsscalekeys_s = "1 1";
     ppsissmooth = 1;
     ppsfps = 2.5;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "300";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 0.600000024;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 0.00999999978;
     velvar = 9.99999975e-005;
     lsppartavg = 300;
     flygravity_s = "0 0 0";
     visname_s = "LIGHTNING_ORIGIN_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "50 150 255";
     vistexcolorend_s = "50 0 255";
     vissizestart_s = "30 30";
     vissizeendscale = 20;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     trltexture_s = "WHITECLOUD.TGA";
};

INSTANCE MFX_HEAVENSRAGE_GROUND (C_PARTICLEFX)
{
     ppsvalue = 40;
     ppsscalekeys_s = "10 9 8 7 6 5 4 3 2 1";
     ppsissmooth = 1;
     ppsfps = 2;
     shptype_s = "CIRCLE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 -60 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.000300000014;
     shpisvolume = 1;
     shpdim_s = "100";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleissmooth = 1;
     shpscalefps = 1;
     dirmode_s = "RAND";
     dirfor_s = "WORLD";
     velavg = 0.00999999978;
     lsppartavg = 250;
     lsppartvar = 50;
     visname_s = "MFX_MAGICCLOUD.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexaniislooping = 2;
     vistexcolorstart_s = "150 255 255";
     vistexcolorend_s = "0 150 255";
     vissizestart_s = "30 30";
     vissizeendscale = 2;
     visalphafunc_s = "ADD";
     visalphastart = 255;
};

///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  C H A I N - L I G H T N I N G  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX


///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  T H U N D E R B O L T  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE MFX_ICEBOLT_INIT (C_PARTICLEFX)
{
     ppsvalue = 50.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.003000000;
     velvar = 0.001000000;
     lsppartavg = 200.000000000;
     lsppartvar = 50.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "LIGHTNING_BIG_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 10.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "0 255 255";
     vissizestart_s = "6 6";
     vissizeendscale = 3.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 180.000000000;
};

INSTANCE MFX_ICEBOLT_CAST (C_PARTICLEFX)
{
     ppsvalue = 30.000000000;
     ppsscalekeys_s = "5";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.100000001;
     shpisvolume = 1;
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.008000000;
     velvar = 0.029999999;
     lsppartavg = 500.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "LIGHTNING_BIG_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "0 255 255";
     vissizestart_s = "6 6";
     vissizeendscale = 4.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE MFX_ICEBOLT_COLLIDE (C_PARTICLEFX)
{
     ppsvalue = 10.000000000;
     ppsfps = 10.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "8";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.079999998;
     velvar = 0.020000000;
     lsppartavg = 500.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "LIGHTNING_BIG_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "0 255 255";
     vissizestart_s = "10 10";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  H O L Y B O L T        XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXX


INSTANCE MFX_PALHOLYBOLT_INIT (C_PARTICLEFX)
{
     ppsvalue = 20;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 0.00300000003;
     velvar = 0.00100000005;
     lsppartavg = 1000;
     lsppartvar = 50;
     flygravity_s = "0 0 0";
     visname_s = "HEAVENLIGHT.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 10;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "100 100 255";
     vissizestart_s = "6 6";
     vissizeendscale = 5;
     visalphafunc_s = "ADD";
     visalphastart = 180;
     useemittersfor = 1;
};

INSTANCE MFX_PALHOLYBOLT_CAST (C_PARTICLEFX)
{
     ppsvalue = 60;
     ppsscalekeys_s = "5";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.100000001;
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 0.00800000038;
     velvar = 0.0299999993;
     lsppartavg = 300;
     flygravity_s = "0 0 0";
     visname_s = "HEAVENLIGHT.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "100 100 255";
     vissizestart_s = "2 5";
     vissizeendscale = 10;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     useemittersfor = 1;
};

INSTANCE MFX_PALHOLYBOLT_COLLIDE (C_PARTICLEFX)
{
     ppsvalue = 10.000000000;
     ppsfps = 10.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "8";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.079999998;
     velvar = 0.020000000;
     lsppartavg = 500.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "LIGHTNING_BIG_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "0 255 255";
     vissizestart_s = "10 10";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  T H U N D E R B A L L  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
INSTANCE MFX_THUNDERBALL_INIT (C_PARTICLEFX)
{
     ppsvalue = 40.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 7 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 7 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.001000000;
     lsppartavg = 150.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_THUNDERSPELL_ELECTRO.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "50 100 255";
     vissizestart_s = "20 20";
     vissizeendscale = 1.500000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

INSTANCE MFX_THUNDERBALL_INVEST_BLAST (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1";
     ppsissmooth = 1;
     ppsfps = 25.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "3";
     shpscalekeys_s = "1 2 3 4 5 6 7 8 9 10 9 8 7 6 5 4 3 2 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 25.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.100000001;
     lsppartavg = 140.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_THUNDERSPELL_ELECTRO.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "50 100 255";
     vissizestart_s = "40 40";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 100.000000000;
     visalphaend = 100.000000000;
};

PROTOTYPE MFX_THUNDERBALL_INVEST_PROTO (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "3 2 1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "20";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.008000000;
     velvar = 0.029999999;
     lsppartavg = 150.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_THUNDERSPELL_ELECTRO.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "50 100 255";
     vissizestart_s = "10 10";
     vissizeendscale = 8.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 100.000000000;
     visalphaend = 100.000000000;
};



INSTANCE MFX_THUNDERBALL_INVEST	(MFX_THUNDERBALL_INVEST_PROTO)
{
	 ppsvalue = 10;
	 vissizeendscale = 5.000000000;
     shpdim_s = "6";
     visalphastart = 180;
     visalphaend = 180;
};

INSTANCE MFX_THUNDERBALL_INVEST_L1 (MFX_THUNDERBALL_INVEST_PROTO)
{
	 ppsvalue = 10;
	 vissizeendscale = 5.000000000;
     shpdim_s = "6";
     visalphastart = 180;
	 visalphaend = 180;
};

INSTANCE MFX_THUNDERBALL_INVEST_L2 (MFX_THUNDERBALL_INVEST_PROTO)
{
	 ppsvalue = 13;
	 vissizeendscale = 6.000000000;
     shpdim_s = "14";
     visalphastart = 200;
     visalphaend = 200;
};

INSTANCE MFX_THUNDERBALL_INVEST_L3 (MFX_THUNDERBALL_INVEST_PROTO)
{
	 ppsvalue = 16;
	 vissizeendscale = 7.000000000;
     shpdim_s = "22";
     visalphastart = 220;
	 visalphaend = 220;
};

INSTANCE MFX_THUNDERBALL_INVEST_L4 (MFX_THUNDERBALL_INVEST_PROTO)
{
	 ppsvalue = 20;
	 vissizeendscale = 8.000000000;
     shpdim_s = "30";
     visalphastart = 255;
	 visalphaend = 255;
};



PROTOTYPE MFX_THUNDERBALL_CAST_PROTO (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "30";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.008000000;
     velvar = 0.029999999;
     lsppartavg = 150.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_THUNDERSPELL_ELECTRO.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "50 100 255";
     vissizestart_s = "15 15";
     vissizeendscale = 1.500000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
	 visalphaend = 255.000000000;
};

INSTANCE MFX_THUNDERBALL_CAST (MFX_THUNDERBALL_CAST_PROTO)
{
	 vissizeendscale = 1.000000000;
     shpdim_s = "10";
     visalphastart = 180;
     visalphaend = 180;
};


INSTANCE MFX_THUNDERBALL_CAST_L1 (MFX_THUNDERBALL_CAST_PROTO)
{
	 vissizeendscale = 1.000000000;
     shpdim_s = "10";
     vissizestart_s = "15 15";
     visalphastart = 100;
     visalphaend = 100;
};


INSTANCE MFX_THUNDERBALL_CAST_L2 (MFX_THUNDERBALL_CAST_PROTO)
{
	 ppsvalue		= 700;
	 vissizeendscale = 1.000000000;
     vissizestart_s = "20 20";
     shpdim_s = "15";
     visalphastart = 150;
     visalphaend = 150;
};


INSTANCE MFX_THUNDERBALL_CAST_L3 (MFX_THUNDERBALL_CAST_PROTO)
{
	 ppsvalue		= 800;
	 vissizeendscale = 2.000000000;
     vissizestart_s = "25 25";
     shpdim_s = "20";
     visalphastart = 200;
	 visalphaend = 200;
};


INSTANCE MFX_THUNDERBALL_CAST_L4 (MFX_THUNDERBALL_CAST_PROTO)
{
	 ppsvalue		= 900;
	 vissizeendscale = 2.000000000;
     vissizestart_s = "30 30";
     shpdim_s = "30";
     visalphastart = 255;
     visalphaend = 255;
};




PROTOTYPE MFX_THUNDERBALL_COLLIDE_PROTO (C_PARTICLEFX)
{
     ppsvalue = 40.000000000;
     ppsscalekeys_s = "4 3 2 1";
     ppsfps = 2.000000000;
     ppscreateem_s = "MFX_FIREBALL_COLLIDE_WALLGLOW";
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "8";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.079999998;
     velvar = 0.020000000;
     lsppartavg = 150.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_THUNDERSPELL_ELECTRO.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "50 100 255";
     vissizestart_s = "70 70";
     vissizeendscale = 1.500000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};


INSTANCE MFX_THUNDERBALL_COLLIDE1	 (MFX_THUNDERBALL_COLLIDE_PROTO)
{
     ppsvalue = 10.000000000;
     vissizestart_s = "40 40";
     visalphastart = 130.000000000;
};

INSTANCE MFX_THUNDERBALL_COLLIDE2	 (MFX_THUNDERBALL_COLLIDE_PROTO)
{
     ppsvalue = 20.000000000;
     vissizestart_s = "50 50";
     visalphastart = 180.000000000;
};

INSTANCE MFX_THUNDERBALL_COLLIDE3	 (MFX_THUNDERBALL_COLLIDE_PROTO)
{
     ppsvalue = 30.000000000;
     vissizestart_s = "60 60";
     visalphastart = 220.000000000;
     ppscreateem_s = "MFX_THUNDERBALL_COLLIDE_SPARKS";
};

INSTANCE MFX_THUNDERBALL_COLLIDE4	 (MFX_THUNDERBALL_COLLIDE_PROTO)
{
     ppsvalue = 40.000000000;
     vissizestart_s = "70 70";
     visalphastart = 255.000000000;
     ppscreateem_s = "MFX_THUNDERBALL_COLLIDE_SPARKS";
};


INSTANCE MFX_THUNDERBALL_COLLIDE_SPARKS (C_PARTICLEFX)
{
     ppsvalue = 20.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "POINT";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "50";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.100000001;
     velvar = 0.050000001;
     lsppartavg = 200.000000000;
     visname_s = "LIGHTNING_BIG_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "50 100 255";
     vissizestart_s = "20 20";
     vissizeendscale = 15.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};


INSTANCE MFX_THUNDERBALL_COLLIDE_WALLGLOW (C_PARTICLEFX)
{
     ppsvalue = 3.000000000;
     ppsscalekeys_s = "5 5 4 4 3 3 2 2 1 1";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "50";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     lsppartavg = 1500.000000000;
     flygravity_s = "0 0.00004 0";
     flycolldet_b = 0;
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "50 100 255";
     vissizestart_s = "2 2";
     vissizeendscale = 20.000000000;
     visalphafunc_s = "ADD";
};




///   													XXXXXXXXXXXXXXXXXXXXX
///   													XX  I C E C U B E  XX
///   													XXXXXXXXXXXXXXXXXXXXX


INSTANCE MFX_ICECUBE_INIT (C_PARTICLEFX)
{
     ppsvalue = 60.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "5";
     shpscalekeys_s = "1 2 1 2";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 0.500000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.001000000;
     velvar = 0.000100000;
     lsppartavg = 150.000000000;
     flygravity_s = "0 0 0";
     visname_s = "MFX_FREEZE_MULTIICE.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 25.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 20";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};


INSTANCE MFX_ICECUBE_CAST (C_PARTICLEFX)
{
     ppsvalue = 100;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.100000001;
     shpisvolume = 1;
     shpdim_s = "20";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 9.99999975e-005;
     lsppartavg = 4000;
     flygravity_s = "0 0 0";
     flycolldet_b = 1;
     visname_s = "MFX_FREEZE_MULTIICE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "15 15";
     vissizeendscale = 1;
     visalphafunc_s = "BLEND";
     visalphastart = 255;
};


INSTANCE MFX_ICESPELL_TARGET (C_PARTICLEFX)
{
     ppsvalue = 100;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 10;
     ppscreateem_s = "MFX_ICESPELL_TARGETEND";
     ppscreateemdelay = 20000;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "30 100 30";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 9.99999997e-007;
     lsppartavg = 20000;
     flygravity_s = "0 0 0";
     visname_s = "MFX_FREEZE_MULTIICE.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "30 30";
     vissizeendscale = 1;
     visalphafunc_s = "BLEND";
     visalphastart = 255;
     visalphaend = 255;
};


INSTANCE MFX_ICESPELL_TARGETEND (C_PARTICLEFX)
{
     ppsvalue = 1000.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "30 100 30";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.100000001;
     velvar = 0.039999999;
     lsppartavg = 1000.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 -0.001 0";
     flycolldet_b = 1;
     visname_s = "MFX_FREEZE_ICEQUADMARK.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "30 30";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 180.000000000;
     visalphaend = 100.000000000;
     mrkfadespeed = 0.100000001;
     mrktexture_s = "MFX_FREEZE_ICEQUADMARK.TGA";
     mrksize = 20.000000000;
};


INSTANCE MFX_ICESPELL_COLLIDE	(C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 3.000000000;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "30 30 30";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.100000001;
     velvar = 0.039999999;
     lsppartavg = 1000.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 -0.001 0";
     flycolldet_b = 1;
     visname_s = "MFX_FREEZE_ICEQUADMARK.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "30 30";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 180.000000000;
     visalphaend = 100.000000000;
     mrkfadespeed = 0.100000001;
     mrktexture_s = "MFX_FREEZE_ICEQUADMARK.TGA";
     mrksize = 20.000000000;
};


///   													XXXXXXXXXXXXXXXXXXXXX
///   													XX  I C E W A V E  XX
///   													XXXXXXXXXXXXXXXXXXXXX

INSTANCE MFX_ICEWAVE_WAVE (C_PARTICLEFX)
{
     ppsvalue = 50;
     ppsscalekeys_s = "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40";
     ppsissmooth = 1;
     ppsfps = 40;
     ppscreateem_s = "MFX_ICEWAVE_WAVE2";
     ppscreateemdelay = 3000;
     shptype_s = "CIRCLE";
     shpfor_s = "world";
     shpoffsetvec_s = "0 -50 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "20";
     shpscalekeys_s = "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40";
     shpscalefps = 40;
     dirmode_s = "RAND";
     dirfor_s = "object";
     diranglehead = 90;
     dirangleheadvar = 45;
     dirangleelev = 90;
     dirangleelevvar = 45;
     velavg = 0.00100000005;
     lsppartavg = 2350;
     flygravity_s = "0";
     visname_s = "MFX_FREEZE_MULTIICE.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 25;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "200 220 255";
     vissizestart_s = "50 50";
     vissizeendscale = 1;
     visalphafunc_s = "BLEND";
     visalphastart = 255;
     visalphaend = 255;
     trltexture_s = "LIGHTNING_BIG_A0.TGA";
};

INSTANCE MFX_ICEWAVE_WAVE2 (C_PARTICLEFX)
{
     ppsvalue = 50;
     ppsscalekeys_s = "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40";
     ppsissmooth = 1;
     ppsfps = 40;
     shptype_s = "CIRCLE";
     shpfor_s = "world";
     shpoffsetvec_s = "0 -50 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "20";
     shpscalekeys_s = "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40";
     shpscalefps = 40;
     dirmode_s = "RAND";
     dirfor_s = "object";
     diranglehead = 90;
     dirangleheadvar = 45;
     dirangleelev = 90;
     dirangleelevvar = 45;
     velavg = 9.99999975e-005;
     lsppartavg = 1000;
     lsppartvar = 100;
     flygravity_s = "0 0 0";
     visname_s = "MFX_FREEZE_MULTIICE.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 25;
     vistexaniislooping = 1;
     vistexcolorstart_s = "200 225 255";
     vistexcolorend_s = "200 220 255";
     vissizestart_s = "50 50";
     vissizeendscale = 0.100000001;
     visalphafunc_s = "BLEND";
     visalphastart = 255;
     visalphaend = 255;
     trltexture_s = "LIGHTNING_BIG_A0.TGA";
};

///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  A R M Y O F D A R K ...  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE MFX_ARMYOFDARKNESS_INIT (C_PARTICLEFX)
{
     ppsvalue = 100;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "20";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 9.99999975e-006;
     lsppartavg = 800;
     flygravity_s = "0 0 0";
     visname_s = "WHITECLOUD.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 100 100";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "10 10";
     vissizeendscale = 8;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     useemittersfor = 1;
};

INSTANCE MFX_ARMYOFDARKNESS_INIT2 (C_PARTICLEFX)
{
     ppsvalue = 100;
     ppsscalekeys_s = "1 1 1 1 1";
     ppsissmooth = 1;
     ppsfps = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "20";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 9.99999975e-006;
     lsppartavg = 800;
     flygravity_s = "0 0 0";
     visname_s = "WHITECLOUD.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 100 100";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "10 10";
     vissizeendscale = 8;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     useemittersfor = 1;
};

INSTANCE MFX_ARMYOFDARKNESS_ORIGIN (C_PARTICLEFX)
{
     ppsvalue = 1000;
     ppsscalekeys_s = "1";
     ppsfps = 2;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "300";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 5;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 9.99999975e-006;
     lsppartavg = 500;
     flygravity_s = "0 0 0";
     visname_s = "WHITECLOUD.TGA";
     visorientation_s = "VELO";
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 100 100";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "1 1";
     vissizeendscale = 200;
     visalphafunc_s = "ADD";
     visalphastart = 255;
};



///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  S U M M O N   D E M O N  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE MFX_SUMMONDEMON_INIT (C_PARTICLEFX)
{
     ppsvalue = 500.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.000010000;
     lsppartavg = 200.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "SIMPLEGLOW.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 100 100";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "2 2";
     vissizeendscale = 5.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

INSTANCE MFX_SUMMONDEMON_INVEST (C_PARTICLEFX)
{
     ppsvalue = 1000.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsfps = 2.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 -120 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 1.000000000;
     shpdim_s = "60";
     shpscalekeys_s = "2 0.5";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 0.600000024;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelev = -89.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.200000003;
     velvar = 0.100000001;
     lsppartavg = 500.000000000;
     flygravity_s = "0 0 0";
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 0 255";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "10 10";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 30.000000000;
};


INSTANCE SPAWN_DEMON	(C_PARTICLEFX)
{
     ppsvalue = 300.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1 1 1 1 ";
     ppsfps = 2.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 -120 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 1.000000000;
     shpdim_s = "40";
     shpscalekeys_s = "2 0.5";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 0.600000024;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.000010000;
     velvar = 0.000100000;
     lsppartavg = 3000.000000000;
     flygravity_s = "0 0.0001 0";
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 100 0";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "5 5";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  S U M M O N   S K E L E T O N  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX


///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  S U M M O N   G O L E M  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE SPAWN_GOLEM	(C_PARTICLEFX)
{
     ppsvalue = 300.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1 1 1 1 ";
     ppsfps = 2.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 -120 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 1.000000000;
     shpdim_s = "40";
     shpscalekeys_s = "2 0.5";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 0.600000024;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.000010000;
     velvar = 0.000100000;
     lsppartavg = 3000.000000000;
     flygravity_s = "0 0.0001 0";
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 100 0";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "5 5";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};


///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  A R M Y   O F   D A R K N E S S  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX


///   													XXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  M A S S D E A T H  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXX


INSTANCE MFX_MASSDEATH_INIT (C_PARTICLEFX)
{
     ppsvalue = 50;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "8";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 5;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 0.00999999978;
     velvar = 9.99999975e-005;
     lsppartavg = 1000;
     flygravity_s = "0 0 0";
     visname_s = "MFX_MAGICCLOUD.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 25;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 20 20";
     vistexcolorend_s = "0 50 255";
     vissizestart_s = "10 10";
     vissizeendscale = 5;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     useemittersfor = 1;
};

INSTANCE MFX_MASSDEATH_LEFTHAND (C_PARTICLEFX)
{
     ppsvalue = 10;
     ppsscalekeys_s = "1 1 1 1 1 1 1";
     ppsissmooth = 1;
     ppsfps = 2;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "3";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 5;
     dirmode_s = "DIR";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleelev = 90;
     velavg = 0.00100000005;
     lsppartavg = 1000;
     flygravity_s = "0 -0.0000001 0";
     visname_s = "MFX_LIGHT_RAY.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 2;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255  80 80";
     vistexcolorend_s = "255 80 80";
     vissizestart_s = "2 35";
     vissizeendscale = 10;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     useemittersfor = 1;
};

INSTANCE MFX_MASSDEATH_RIGHTHAND (C_PARTICLEFX)
{
     ppsvalue = 10;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 6;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "3";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 5;
     dirmode_s = "DIR";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleelev = 90;
     lsppartavg = 1000;
     flygravity_s = "0 -0.0000001 0";
     visname_s = "MFX_LIGHT_RAY.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 2;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 150 255";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "2 35";
     vissizeendscale = 10;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     useemittersfor = 1;
};



INSTANCE MFX_MASSDEATH_INIT_GLOW (C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "5";
     shpscalekeys_s = "1 2 1 2";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 0.500000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.600000024;
     velvar = 0.020000000;
     lsppartavg = 2000.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_Spell_Star.tga";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 25.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 150 0";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "1 1";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     trlfadespeed = 0.800000012;
     trltexture_s = "MFX_FIRERAIN_RAINTRAIL.TGA";
     trlwidth = 1.000000000;
};

INSTANCE MFX_MASSDEATH_EXPLOSION (C_PARTICLEFX)
{
     ppsvalue = 1000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 5;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "5";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelev = -90;
     velavg = 0.00999999978;
     lsppartavg = 500;
     lsppartvar = 200;
     flygravity_s = "0";
     visname_s = "HEAVENLIGHT.TGA";
     visorientation_s = "VELO";
     vistexanifps = 2;
     vistexaniislooping = 2;
     vistexcolorstart_s = "255 0 255";
     vistexcolorend_s = "255 100 255";
     vissizestart_s = "1 30";
     vissizeendscale = 20;
     visalphafunc_s = "ADD";
     visalphastart = 255;
};

INSTANCE MFX_MASSDEATH_CAST (C_PARTICLEFX)
{
     ppsvalue = 60;
     ppsscalekeys_s = "1 1 2 2 2 3 3 4 4 5";
     ppsissmooth = 1;
     ppsfps = 3;
     shptype_s = "CIRCLE";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "120";
     shpscalekeys_s = "1 2 3 4 5 6 7 8 9 10";
     shpscaleissmooth = 1;
     shpscalefps = 3;
     dirmode_s = "RAND";
     dirfor_s = "object";
     diranglehead = 90;
     dirangleheadvar = 45;
     dirangleelev = 90;
     dirangleelevvar = 45;
     velavg = 0.100000001;
     lsppartavg = 1500;
     lsppartvar = 300;
     flygravity_s = "0 0.00008 0";
     visname_s = "MFX_MAGICCLOUD.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 25;
     vistexaniislooping = 2;
     vistexcolorstart_s = "255 0 255";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "20 20";
     vissizeendscale = 20;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     trltexture_s = "LIGHTNING_BIG_A0.TGA";
};

INSTANCE MFX_MASSDEATH_TARGET (C_PARTICLEFX)
{
     ppsvalue = 5;
     ppsscalekeys_s = "3 3 3 2 2 1 1";
     ppsissmooth = 1;
     ppsfps = 1;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "50";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscalefps = 15;
     dirmode_s = "DIR";
     dirfor_s = "object";
     diranglehead = 90;
     dirangleheadvar = 45;
     dirangleelev = 90;
     dirangleelevvar = 45;
     velavg = 9.99999975e-005;
     lsppartavg = 1000;
     lsppartvar = 300;
     flygravity_s = "0 0.0001 0";
     visname_s = "HEAVENLIGHT.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 25;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 150 150";
     vistexcolorend_s = "150 150 255";
     vissizestart_s = "5 50";
     vissizeendscale = 10;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     trltexture_s = "LIGHTNING_BIG_A0.TGA";
};

///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  R E P E L   E V I L          XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX


INSTANCE MFX_REPELEVIL_INIT (C_PARTICLEFX)
{
     ppsvalue = 40;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "100";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelev = -90;
     velavg = 0.00100000005;
     lsppartavg = 2000;
     lsppartvar = 500;
     flygravity_s = "0 -0.0000001 0";
     visname_s = "HEAVENLIGHT.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 2;
     vistexcolorstart_s = "255 0 0";
     vistexcolorend_s = "0 255 255";
     vissizestart_s = "1 50";
     vissizeendscale = 3;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     useemittersfor = 1;
};

INSTANCE MFX_REPELEVIL_CAST (C_PARTICLEFX)
{
     ppsvalue = 40;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "100";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelev = -90;
     velavg = 0.00100000005;
     lsppartavg = 4000;
     lsppartvar = 1000;
     flygravity_s = "0 -0.0000001 0";
     visname_s = "HEAVENLIGHT.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "225 0 255";
     vissizestart_s = "1 50";
     vissizeendscale = 10;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     useemittersfor = 1;
};

INSTANCE MFX_REPELEVIL_TRAIL (C_PARTICLEFX)
{
     ppsvalue = 200;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "5";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelev = -90;
     velavg = 0.0199999996;
     velvar = 0.00999999978;
     lsppartavg = 2000;
     flygravity_s = "0 0.00005 0";
     visname_s = "GLOWWORM.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "2 2";
     vissizeendscale = 4;
     visalphafunc_s = "ADD";
     visalphastart = 255;
};

INSTANCE MFX_REPELEVIL_COLLIDE (C_PARTICLEFX)
{
     ppsvalue = 30;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 1;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "100";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelev = -90;
     velavg = 0.00100000005;
     lsppartavg = 4000;
     lsppartvar = 1000;
     flygravity_s = "0 -0.0000001 0";
     visname_s = "HEAVENLIGHT.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 2;
     vistexcolorstart_s = "255 0 0";
     vistexcolorend_s = "0 255 255";
     vissizestart_s = "1 50";
     vissizeendscale = 10;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     useemittersfor = 1;
};

///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  M A S T E R O F D I S A S T E R XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX


INSTANCE MFX_MASTEROFDISASTER_INIT (C_PARTICLEFX)
{
     ppsvalue = 5;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "100";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelev = -90;
     velavg = 0.00100000005;
     lsppartavg = 2000;
     lsppartvar = 500;
     flygravity_s = "0 -0.0000001 0";
     visname_s = "mfx_masterofdisaster_aura_16bit.tga";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 2;
     vistexcolorstart_s = "255 255 200";
     vistexcolorend_s = "255 200 200";
     vissizestart_s = "100 100";
     vissizeendscale = 3;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     useemittersfor = 1;
};

INSTANCE MFX_MasterOfDisaster_CAST (C_PARTICLEFX)
{
     ppsvalue = 40;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "100";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelev = -90;
     velavg = 0.00100000005;
     lsppartavg = 4000;
     lsppartvar = 1000;
     flygravity_s = "0 -0.0000001 0";
     visname_s = "HEAVENLIGHT.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "225 0 255";
     vissizestart_s = "1 50";
     vissizeendscale = 10;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     useemittersfor = 1;
};

INSTANCE MFX_MASTEROFDISASTER_TRAIL (C_PARTICLEFX)
{
     ppsvalue = 20;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "5";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelev = -90;
     velavg = 0.0199999996;
     velvar = 0.00999999978;
     lsppartavg = 2000;
     flygravity_s = "0 0 0";
     visname_s = "HEAVENLIGHT.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "100";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "1 15";
     vissizeendscale = 50;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     useemittersfor = 1;
};

INSTANCE MFX_MASTEROFDISASTER_COLLIDE (C_PARTICLEFX)
{
     ppsvalue = 30;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 1;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "100";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelev = -90;
     velavg = 0.00100000005;
     lsppartavg = 4000;
     lsppartvar = 1000;
     flygravity_s = "0 -0.0000001 0";
     visname_s = "mfx_masterofdisaster_aura_16bit.tga";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 2;
     vistexcolorstart_s = "255 255 200";
     vistexcolorend_s = "255 0 0 ";
     vissizestart_s = "50 50";
     vissizeendscale = 5;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     useemittersfor = 1;
};


///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  D E S T R O Y   U N D E A D  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX


INSTANCE MFX_DESTROYUNDEAD_INIT (C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.001000000;
     lsppartavg = 800.000000000;
     lsppartvar = 100.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "DESTROYUNDEAD3.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 100 255";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "3 3";
     vissizeendscale = 30.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE MFX_DESTROYUNDEAD_COLLIDE (C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
     ppsscalekeys_s = "1";
     ppsfps = 5.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.001000000;
     lsppartavg = 800.000000000;
     lsppartvar = 100.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "DESTROYUNDEAD3.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 100 255";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "3 3";
     vissizeendscale = 200.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE MFX_DESTROYUNDEAD_CAST (C_PARTICLEFX)
{
     ppsvalue = 20.000000000;
     ppsscalekeys_s = "1 1 1";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 1.000000000;
     shpisvolume = 1;
     shpdim_s = "20";
     shpscalekeys_s = "1 1.5 2 2.5 3 3.5 4 4.5 5";
     shpscaleissmooth = 1;
     shpscalefps = 3.000000000;
     dirmode_s = "DIR";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.500000000;
     velvar = 0.100000001;
     lsppartavg = 1000.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 0 0";
     visname_s = "DESTROYUNDEAD3.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 100 255";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "10 40";
     vissizeendscale = 30.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     trltexture_s = "DESTROYUNDEAD2.TGA";
};

INSTANCE MFX_DESTROYUNDEAD_SOUL (C_PARTICLEFX)
{
     ppsvalue = 50.000000000;
     ppsscalekeys_s = "1 2 3 2 2 1 1";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 1.000000000;
     shpisvolume = 1;
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleissmooth = 1;
     shpscalefps = 3.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     diranglehead = 89.000000000;
     dirangleheadvar = 8.000000000;
     dirangleelevvar = 8.000000000;
     velavg = 1.000000000;
     lsppartavg = 500.000000000;
     lsppartvar = 200.000000000;
     flygravity_s = "0 0 0";
     visname_s = "AURA.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 255 255";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "1 1";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     trlfadespeed = 1.000000000;
     trltexture_s = "LIGHTNING_BIG_A0.TGA";
     trlwidth = 3.000000000;
};

INSTANCE MFX_DESTROYUNDEAD_SOUL_BACK (C_PARTICLEFX)
{
     ppsvalue = 50.000000000;
     ppsscalekeys_s = "1 2 3 2 2 1 1";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 1.000000000;
     shpisvolume = 1;
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleissmooth = 1;
     shpscalefps = 3.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     diranglehead = -89.000000000;
     dirangleheadvar = 8.000000000;
     dirangleelevvar = 8.000000000;
     velavg = 1.000000000;
     lsppartavg = 500.000000000;
     lsppartvar = 200.000000000;
     flygravity_s = "0 0 0";
     visname_s = "AURA.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 255 255";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "1 1";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     trlfadespeed = 1.000000000;
     trltexture_s = "LIGHTNING_BIG_A0.TGA";
     trlwidth = 3.000000000;
};


INSTANCE MFX_DESTROYUNDEAD_SOUL_CLOUD (C_PARTICLEFX)
{
     ppsvalue = 30.000000000;
     ppsscalekeys_s = "1 1 1 1 0.6 0.6 0.3 0.3";
     ppsissmooth = 1;
     ppsfps = 3.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 1.000000000;
     shpdim_s = "5";
     shpscalekeys_s = "1";
     shpscaleissmooth = 1;
     shpscalefps = 3.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 89.000000000;
     dirangleelev = 89.000000000;
     dirangleelevvar = 15.000000000;
     velavg = 0.010000000;
     lsppartavg = 2000.000000000;
     flygravity_s = "0 0.0001 0";
     visname_s = "STOMPERDUST.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 6.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 100 255";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "1 1";
     vissizeendscale = 50.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     trltexture_s = "JUSTWHITE.TGA";
};


///   													XXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  W I N D F I S T   XX	// schleudert nur einen
///   													XXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE MFX_WINDFIST_INIT (C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
     ppsislooping = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 2.000000000;
     shpdim_s = "3";
     shpscalekeys_s = "1 2 3 4 5 4 3 4 6 8 7 5 4 2 6 5 4 3 2";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 10.000000000;
     dirmode_s = "DIR";
     lsppartavg = 500.000000000;
     lsppartvar = 200.000000000;
     flygravity_s = "0 0 0";
     visname_s = "GROUNDFOG.TGA";
     vistexanifps = 3.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "2 2";
     vissizeendscale = 20.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
};

INSTANCE MFX_WINDFIST_COLLISIONDUMMY (C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
     ppsislooping = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 2.000000000;
     shpdim_s = "30";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 10.000000000;
     dirmode_s = "DIR";
     lsppartavg = 500.000000000;
     lsppartvar = 200.000000000;
     flygravity_s = "0 0 0";
     visname_s = "GROUNDFOG.TGA";
     vistexanifps = 3.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "2 2";
     vissizeendscale = 20.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
     useemittersfor = 1;
};

INSTANCE MFX_WINDFIST_INVEST (C_PARTICLEFX)
{
     ppsvalue = 80.000000000;
     ppsislooping = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 2.000000000;
     shpdim_s = "200";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 10.000000000;
     dirmode_s = "TARGET";
     dirmodetargetfor_s = "OBJECT";
     velavg = 0.100000001;
     lsppartavg = 1750.000000000;
     lsppartvar = 500.000000000;
     flygravity_s = "0 0 0";
     visname_s = "GROUNDFOG.TGA";
     vistexanifps = 3.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "220 220 255";
     vistexcolorend_s = "220 220 255";
     vissizestart_s = "200 200";
     visalphafunc_s = "BLEND";
     visalphaend = 255.000000000;
};

INSTANCE MFX_WINDFIST_INVEST_BLAST (C_PARTICLEFX)
{
     ppsvalue = 2000.000000000;
     ppsscalekeys_s = "1";
     ppsfps = 20.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 2.000000000;
     shpdim_s = "250";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 10.000000000;
     dirmode_s = "TARGET";
     dirmodetargetfor_s = "OBJECT";
     velavg = 0.400000006;
     lsppartavg = 800.000000000;
     flygravity_s = "0 0 0";
     visname_s = "GROUNDFOG.TGA";
     vistexanifps = 25.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "220 220 255";
     vistexcolorend_s = "220 220 255";
     vissizestart_s = "100 100";
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
};

INSTANCE MFX_WINDFIST_CAST (C_PARTICLEFX)
{
     ppsvalue = 50.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "50";
     shpscalekeys_s = "1 10";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     dirmode_s = "DIR";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "1000 0 0";
     velavg = 2.000000000;
     velvar = 0.500000000;
     lsppartavg = 1000.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 0.0001 0";
     visname_s = "GROUNDFOG.TGA";
     visorientation_s = "NONE";
     vistexanifps = 3.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "200 200 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "5 5";
     vissizeendscale = 150.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
     trltexture_s = "WHITECLOUD.TGA";
};

INSTANCE MFX_WINDFIST_CASTDUMMY (C_PARTICLEFX)
{
     ppsvalue = 30.000000000;
     ppsscalekeys_s = "5";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.100000001;
     shpisvolume = 1;
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.008000000;
     velvar = 0.029999999;
     lsppartavg = 500.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "LIGHTNING_BIG_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "0 255 255";
     vissizestart_s = "6 6";
     vissizeendscale = 4.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};


INSTANCE MFX_WINDFIST_TARGET (C_PARTICLEFX)
{
     ppsvalue = 300.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "8";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.079999998;
     velvar = 0.020000000;
     lsppartavg = 500.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "GROUNDFOG.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "10 10";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
};


///   													XXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  S T O R M F I S T   XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXX


INSTANCE MFX_STORMFIST_CAST (C_PARTICLEFX)
{
     ppsvalue = 80.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "50";
     shpscalekeys_s = "1 10";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     dirmode_s = "DIR";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "1000 0 0";
     dirangleheadvar = 30.000000000;
     dirangleelevvar = 30.000000000;
     velavg = 2.000000000;
     velvar = 0.500000000;
     lsppartavg = 1000.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 0.0001 0";
     visname_s = "GROUNDFOG.TGA";
     visorientation_s = "NONE";
     vistexanifps = 3.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "200 200 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 20";
     vissizeendscale = 300.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
     trltexture_s = "WHITECLOUD.TGA";
};

///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  T E L E K I N E S I S  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE MFX_TELEKINESIS_INIT (C_PARTICLEFX)
{
     ppsvalue = 600.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.001000000;
     lsppartavg = 150.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "100 255 255";
     vistexcolorend_s = "255 255 0";
     vissizestart_s = "10 10";
     vissizeendscale = 0.010000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

INSTANCE MFX_TELEKINESIS_BRIDGE (C_PARTICLEFX)
{
     ppsvalue = 250.000000000;
     ppsscalekeys_s = "1 2 3 2";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "4";
     shpscalekeys_s = "1 3 5 3 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "WORLD";
     dirmodetargetfor_s = "WORLD";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.800000012;
     velvar = 0.200000003;
     lsppartavg = 500.000000000;
     flygravity_s = "0 0 0";
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "100 255 255";
     vistexcolorend_s = "100 255 255";
     vissizestart_s = "10 10";
     vissizeendscale = 2.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     trltexture_s = "WHITECLOUD.TGA";
};

INSTANCE MFX_TELEKINESIS_TARGET (C_PARTICLEFX)
{
     ppsvalue = 1500.000000000;
     ppsislooping = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.000300000;
     shpdim_s = "40";
     dirmode_s = "RAND";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     velavg = 0.001000000;
     lsppartavg = 200.000000000;
     flygravity_s = "0";
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 10.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "100 255 255";
     vissizestart_s = "30 30";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphaend = 255.000000000;
};


INSTANCE MFX_TELEKINESIS_TARGETEND (C_PARTICLEFX)
{
     ppsvalue = 1500.000000000;
     ppsscalekeys_s = "1";
     ppsfps = 10.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.000300000;
     shpdim_s = "40";
     dirmode_s = "RAND";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     velavg = 0.050000001;
     lsppartavg = 2000.000000000;
     flygravity_s = "0 -0.0008 0";
     flycolldet_b = 1;
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 10.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "200 255 255";
     vistexcolorend_s = "100 255 255";
     vissizestart_s = "30 30";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  M A S T E R   T E L E K I N E S I S  XX		// kann auch NPCs anheben
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX


INSTANCE MFX_MasterTelekinesis_INIT		(C_PARTICLEFX)
{
     ppsvalue = 20.;
	 ppsislooping = 0;
	 ppsfps   = 0.5;
	 ppsScaleKeys_S = "1.0";
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 3.00000014e-004;
     shpisvolume = 1;
     shpdim_s = "40";
     dirmode_s = "DIR";
     dirfor_s = "object";
     lsppartavg = 1200.;
     lsppartvar = 200.;
     flygravity_s = "0 0.0001 0";
     vistexisquadpoly = 1;
     visname_s = "pfxani15.TGA";
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "50 50";
     vissizeendscale = 5.;
     visalphafunc_s = "ADD";
     visalphastart = 100.;
};



///   													XXXXXXXXXXXXXXXXXX
///   													XX  C H A R M   XX
///   													XXXXXXXXXXXXXXXXXX

INSTANCE MFX_CHARM_INIT (C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.050000001;
     lsppartavg = 1400.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "100 200 255";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "30 30";
     vissizeendscale = 0.010000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

INSTANCE MFX_CHARM_ORIGIN (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1 1.1 1 0.8 0.7 0.6 0.5 0.4 0.3 0.2 0.1";
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.100000001;
     lsppartavg = 2000.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 1;
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "100 200 255";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "35 35";
     vissizeendscale = 0.010000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

INSTANCE MFX_CHARM_TARGET (C_PARTICLEFX)
{
     ppsvalue = 50.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1 1 0.7 0.4";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 120 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "50";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.010000000;
     lsppartavg = 3000.000000000;
     flygravity_s = "0 -0.00003 0";
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 0";
     vissizestart_s = "20 20";
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};


///   													XXXXXXXXXXXXXXXXX
///   													XX  S L E E P  XX
///   													XXXXXXXXXXXXXXXXX

INSTANCE MFX_SLEEP_INIT (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.050000001;
     lsppartavg = 1400.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 0";
     vissizestart_s = "10 10";
     vissizeendscale = 0.010000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

INSTANCE MFX_SLEEP_ORIGIN (C_PARTICLEFX)
{
     ppsvalue = 400.000000000;
     ppsscalekeys_s = "";
     //ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.100000001;
     lsppartavg = 2000.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 0";
     vissizestart_s = "20 20";
     vissizeendscale = 0.010000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

INSTANCE MFX_SLEEP_TARGET (C_PARTICLEFX)
{
     ppsvalue = 50.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1 1 0.7 0.4";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 120 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "50";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.010000000;
     lsppartavg = 3000.000000000;
     flygravity_s = "0 -0.00003 0";
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 0";
     vissizestart_s = "20 20";
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};


///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  P Y R O K I N E S I S  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE MFX_PYROKINESIS_INIT (C_PARTICLEFX)
{
     ppsvalue = 50;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "NONE";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 0.00999999978;
     lsppartavg = 500;
     lsppartvar = 200;
     flygravity_s = "0 0 0";
     visname_s = "MFX_MAGICCLOUD.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 50";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "5 5";
     vissizeendscale = 12;
     visalphafunc_s = "ADD";
     visalphastart = 255;
};

INSTANCE MFX_PYROKINESIS_BRIDGE (C_PARTICLEFX)
{
     ppsvalue = 50;
     ppsscalekeys_s = "1 2 3 2";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2;
     shptype_s = "SPHERE";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1 2 3 4 3 2";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1;
     dirmode_s = "TARGET";
     dirfor_s = "WORLD";
     dirmodetargetfor_s = "WORLD";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 0.5;
     velvar = 0.100000001;
     lsppartavg = 2000;
     flygravity_s = "0 0 0";
     visname_s = "MFX_FIREBALL.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 2;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "30 30";
     vissizeendscale = 2;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     trltexture_s = "WHITECLOUD.TGA";
};

INSTANCE MFX_PYROKINESIS_ORIGIN (C_PARTICLEFX)
{
     ppsvalue = 20.000000000;
     ppsscalekeys_s = "3 2 1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "30";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.008000000;
     velvar = 0.029999999;
     lsppartavg = 2000.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 220 220";
     vistexcolorend_s = "255 220 220";
     vissizestart_s = "10 10";
     vissizeendscale = 8.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 100.000000000;
};

INSTANCE MFX_PYROKINESIS_TARGET (C_PARTICLEFX)
{
     ppsvalue = 500;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2;
     shptype_s = "SPHERE";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "400";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 0.5;
     lsppartavg = 1000;
     flygravity_s = "0 0 0";
     visname_s = "MFX_MAGICCLOUD.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 0 0";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "2 2";
     vissizeendscale = 20;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     visalphaend = 255;
     trlfadespeed = 1;
     trltexture_s = "MFX_PYROTRAIL.TGA";
     trlwidth = 10;
};


///   													XXXXXXXXXXXXXXXXXXXXX
///   													XX  C O N T R O L  XX
///   													XXXXXXXXXXXXXXXXXXXXX

INSTANCE MFX_CONTROL_INIT (C_PARTICLEFX)
{
     ppsvalue = 660.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.001000000;
     lsppartavg = 150.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 0";
     vissizestart_s = "10 10";
     vissizeendscale = 0.010000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

INSTANCE MFX_CONTROL_BRIDGE (C_PARTICLEFX)
{
     ppsvalue = 30.000000000;
     ppsscalekeys_s = "1 2 3 2";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "WORLD";
     dirmodetargetfor_s = "WORLD";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.300000012;
     velvar = 0.100000001;
     lsppartavg = 5000.000000000;
     flygravity_s = "0 0 0";
     visname_s = "GROUNDFOG.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 100";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 150.000000000;
     visalphaend = 150.000000000;
     trltexture_s = "WHITECLOUD.TGA";
};

INSTANCE MFX_CONTROL_ORIGIN (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsislooping = 1;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.000300000;
     shpdim_s = "30";
     dirmode_s = "RAND";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     velavg = 0.100000001;
     velvar = 0.010000000;
     lsppartavg = 3000.000000000;
     flygravity_s = "0";
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 10.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "10 100";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};


INSTANCE MFX_CONTROL_TARGET (C_PARTICLEFX)
{
     ppsvalue = 1000.000000000;
     ppsislooping = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.000300000;
     shpdim_s = "120";
     shpscalekeys_s = "1 2";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     velavg = 0.100000001;
     velvar = 0.010000000;
     lsppartavg = 1000.000000000;
     flygravity_s = "0";
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 10.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "10 100";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     trltexture_s = "JUSTWHITE.TGA";
};


///   													XXXXXXXXXXXXXXX
///   													XX  F E A R  XX
///   													XXXXXXXXXXXXXXX

INSTANCE MFX_FEAR_GHOST (C_PARTICLEFX)
{
     ppsvalue = 20;
     ppsscalekeys_s = "1 1 1 1 1 1 1 1";
     ppsissmooth = 1;
     ppsfps = 2;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "100";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelev = -90;
     velavg = 0.00100000005;
     lsppartavg = 2000;
     lsppartvar = 500;
     flygravity_s = "0 -0.0000001 0";
     visname_s = "HEAVENLIGHT.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 2;
     vistexcolorstart_s = "255 0 0";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "4 50";
     vissizeendscale = 2;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     useemittersfor = 1;
};

INSTANCE MFX_FEAR_GHOSTTRAIL (C_PARTICLEFX)
{
     ppsvalue = 50;
     ppsscalekeys_s = "1 1 1 1 1 1 1 1";
     ppsissmooth = 1;
     ppsfps = 2;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "5";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelev = -90;
     velavg = 0.0199999996;
     velvar = 0.00999999978;
     lsppartavg = 2000;
     flygravity_s = "0 0.00005 0";
     visname_s = "GLOWWORM.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 0 100";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "2 2";
     vissizeendscale = 4;
     visalphafunc_s = "ADD";
     visalphastart = 255;
};

INSTANCE MFX_FEAR_GHOSTEND (C_PARTICLEFX)
{
     ppsvalue = 50;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 1;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "100";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelev = -90;
     velavg = 0.00100000005;
     lsppartavg = 1000;
     lsppartvar = 500;
     flygravity_s = "0 -0.0000001 0";
     visname_s = "HEAVENLIGHT.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 2;
     vistexcolorstart_s = "255 0 0";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "5 50";
     vissizeendscale = 15;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     useemittersfor = 1;
};


INSTANCE MFX_FEAR_INIT (C_PARTICLEFX)
{
     ppsvalue = 80;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "100";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelev = -90;
     velavg = 0.00100000005;
     lsppartavg = 2000;
     lsppartvar = 500;
     flygravity_s = "0 -0.0000001 0";
     visname_s = "HEAVENLIGHT.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 2;
     vistexcolorstart_s = "255 0 0";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "1 50";
     vissizeendscale = 3;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     useemittersfor = 1;
};


INSTANCE MFX_FEAR_ORIGIN (C_PARTICLEFX)
{
     ppsvalue = 20;
     ppsscalekeys_s = "1 1 1 1 1 1 1 1";
     ppsissmooth = 1;
     ppsfps = 2;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 -80 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "20";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1;
     dirmode_s = "DIR";
     dirfor_s = "world";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelev = 90;
     velavg = 0.00999999978;
     lsppartavg = 1000;
     lsppartvar = 500;
     flygravity_s = "0 0 0";
     visname_s = "HEAVENLIGHT.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 0 0";
     vistexcolorend_s = "255 0 50";
     vissizestart_s = "4 25";
     vissizeendscale = 20;
     visalphafunc_s = "ADD";
     visalphastart = 255;
};

INSTANCE MFX_FEAR_CLOUD (C_PARTICLEFX)
{
     ppsvalue = 50;
     ppsscalekeys_s = "5";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "200";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "TARGET";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 0.0500000007;
     velvar = 0.0299999993;
     lsppartavg = 2000;
     flygravity_s = "0 0 0";
     visname_s = "MFX_FIREBALL.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 2;
     vistexcolorstart_s = "255 0 0";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "50 50";
     vissizeendscale = 0.00100000005;
     visalphafunc_s = "ADD";
     visalphastart = 150;
};

INSTANCE MFX_FEAR_WINGS (C_PARTICLEFX)
{
     ppsvalue = 50;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 2;
     shptype_s = "MESH";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "200";
     shpmesh_s = "MFX_FEAR4.3DS";
     shpmeshrender_b = 2;
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelev = -90;
     velavg = 0.00999999978;
     velvar = 0.00499999989;
     lsppartavg = 1000;
     flygravity_s = "0 0 0";
     visname_s = "MFX_FIREBALL.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 0 255";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "25 25";
     vissizeendscale = 5;
     visalphafunc_s = "ADD";
     visalphastart = 255;
};

INSTANCE MFX_FEAR_WINGS2 (C_PARTICLEFX)
{
     ppsvalue = 25;
     ppsscalekeys_s = "1 1 1 1 1";
     ppsissmooth = 1;
     ppsfps = 1;
     shptype_s = "MESH";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "200";
     shpmesh_s = "MFX_FEAR4.3DS";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelev = -90;
     velavg = 0.00999999978;
     velvar = 0.00499999989;
     lsppartavg = 2000;
     flygravity_s = "0 0 0";
     visname_s = "MFX_FIREBALL.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 0 255";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "25 25";
     vissizeendscale = 5;
     visalphafunc_s = "ADD";
     visalphastart = 255;
};

INSTANCE OLD_MFX_FEAR_INIT (C_PARTICLEFX)
{
     ppsvalue = 20.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 20 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "2";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.003000000;
     velvar = 0.001000000;
     lsppartavg = 150.000000000;
     lsppartvar = 50.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_FEAR_DEMONFACE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "200 100 0";
     vistexcolorend_s = "200 200 0";
     vissizestart_s = "30 30";
     vissizeendscale = 2.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 180.000000000;
};

INSTANCE OLD_MFX_FEAR_ORIGIN (C_PARTICLEFX)
{
     ppsvalue = 20.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1 1 0.5 0.5 0.5";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 100 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "120";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.001000000;
     lsppartavg = 5000.000000000;
     lsppartvar = 1000.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 0 0";
     vistexcolorend_s = "255 50 0";
     vissizestart_s = "30 30";
     vissizeendscale = 5.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     trltexture_s = "MFX_PYROKINESIS_TARGETTRAIL.TGA";
};

INSTANCE OLD_MFX_FEAR_FACE (C_PARTICLEFX)
{
     ppsvalue = 2.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1 1 0.5 0.5 0.5";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 100 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "12";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.003000000;
     velvar = 0.001000000;
     lsppartavg = 2000.000000000;
     lsppartvar = 500.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_FEAR_DEMONFACE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "50 0 0";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "200 200";
     vissizeendscale = 1.200000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};



INSTANCE OLD_MFX_FEAR_WAVE (C_PARTICLEFX)
{
     ppsvalue = 10.000000000;
     ppsscalekeys_s = "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40";
     ppsissmooth = 1;
     ppsfps = 15.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 -150 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "40";
     shpscalekeys_s = "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40";
     shpscalefps = 15.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     diranglehead = 90.000000000;
     dirangleheadvar = 45.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 45.000000000;
     velavg = 0.000100000;
     lsppartavg = 1000.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 0.00008 0";
     visname_s = "WHITECLOUD.TGA";
     visorientation_s = "VELO";
     vistexanifps = 25.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 50 50";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "20 20";
     vissizeendscale = 20.000000000;
     visalphafunc_s = "ADD";
     visalphaend = 255.000000000;
     trltexture_s = "LIGHTNING_BIG_A0.TGA";
};



///   													XXXXXXXXXXXXXXXXXXXX
///   													XX  F O R G E T	  XX
///   													XXXXXXXXXXXXXXXXXXXX

INSTANCE MFX_FORGET_INIT (C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.050000001;
     lsppartavg = 1400.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 0 0";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "20 20";
     vissizeendscale = 0.010000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

INSTANCE MFX_FORGET_ORIGIN (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1 1.1 1 0.8 0.7 0.6 0.5 0.4 0.3 0.2 0.1";
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.100000001;
     lsppartavg = 2000.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 0 0";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "30 30";
     vissizeendscale = 0.010000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

///   													XXXXXXXXXXXXXXXXXXXXX
///   													XX  B E R Z E R K  XX
///   													XXXXXXXXXXXXXXXXXXXXX

INSTANCE MFX_BERZERK_INIT (C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.050000001;
     lsppartavg = 1400.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 0 0";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "20 20";
     vissizeendscale = 0.010000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

INSTANCE MFX_BERZERK_ORIGIN (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1 1.1 1 0.8 0.7 0.6 0.5 0.4 0.3 0.2 0.1";
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.100000001;
     lsppartavg = 2000.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 0 0";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "30 30";
     vissizeendscale = 0.010000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

INSTANCE MFX_BERZERK_TARGET (C_PARTICLEFX)
{
     ppsvalue = 50.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1 1 0.7 0.4";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 120 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "50";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.010000000;
     lsppartavg = 3000.000000000;
     flygravity_s = "0 -0.00003 0";
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 0";
     vissizestart_s = "20 20";
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};




///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  B R E A T H   O F   D E A T H  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE MFX_BREATHOFDEATH_INIT (C_PARTICLEFX)
{
     ppsvalue = 50;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "30";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelev = -90;
     velavg = 0.00100000005;
     lsppartavg = 1000;
     lsppartvar = 1000;
     flygravity_s = "0 0 0";
     visname_s = "MFX_BREATHOFDEATH.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "5 5";
     vissizeendscale = 15;
     visalphafunc_s = "BLEND";
     visalphastart = 255;
};

INSTANCE MFX_BREATHOFDEATH_INVEST (C_PARTICLEFX)
{
     ppsvalue = 20;
     ppsscalekeys_s = "1";
     ppsislooping = 0;
     ppsissmooth = 1;
     ppsfps = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "50";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelev = -90;
     velavg = 0.00100000005;
     lsppartavg = 4000;
     lsppartvar = 1000;
     flygravity_s = "0 0 0";
     visname_s = "MFX_BREATHOFDEATH.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "10 10";
     vissizeendscale = 10;
     visalphafunc_s = "BLEND";
     visalphastart = 255;
};

INSTANCE MFX_BREATHOFDEATH_CAST (C_PARTICLEFX)
{
     ppsvalue = 50;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "5";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "WORLD";
     dirmodetargetpos_s = "0 0 0";
     diranglehead = 180;
     dirangleheadvar = 1;
     velavg = 0.00999999978;
     lsppartavg = 3000;
     lsppartvar = 500;
     flygravity_s = "0 0 0";
     visname_s = "MFX_BREATHOFDEATH.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 2;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "30 30";
     vissizeendscale = 2;
     visalphafunc_s = "BLEND";
     visalphastart = 255;
     flockmode = "WIND";
     flockstrength = 0.300000012;
};

INSTANCE MFX_BREATHOFDEATH_COLLIDE (C_PARTICLEFX)
{
     ppsvalue = 40;
     ppsscalekeys_s = "1 1 1 1 1 1 1 1 1 1";
     ppsissmooth = 1;
     ppsfps = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "100";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelev = -90;
     velavg = 0.00100000005;
     lsppartavg = 4000;
     lsppartvar = 1000;
     flygravity_s = "0 0 0";
     visname_s = "MFX_BREATHOFDEATH.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 2;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "50 50";
     vissizeendscale = 1;
     visalphafunc_s = "BLEND";
     visalphastart = 255;
     useemittersfor = 1;
};

INSTANCE OLD_MFX_BREATHOFDEATH_INIT (C_PARTICLEFX)
{
     ppsvalue = 15;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsfps = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpdim_s = "50";
     dirmode_s = "TARGET";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     velavg = 0.0199999996;
     lsppartavg = 2500;
     lsppartvar = 200;
     flygravity_s = "0 0 0";
     visname_s = "GROUNDFOG.TGA";
     visorientation_s = "NONE";
     vistexcolorstart_s = "0 0 0";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "30 30";
     vissizeendscale = 1;
     visalphafunc_s = "BLEND";
     visalphaend = 255;
     useemittersfor = 1;
};

INSTANCE OLD_MFX_BREATHOFDEATH_INVEST (C_PARTICLEFX)
{
     ppsvalue = 100;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 2;
     shpdim_s = "200";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 10;
     dirmode_s = "TARGET";
     dirmodetargetfor_s = "OBJECT";
     velavg = 0.300000012;
     lsppartavg = 500;
     lsppartvar = 500;
     flygravity_s = "0 0 0";
     visname_s = "GROUNDFOG.TGA";
     vistexanifps = 3;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 0 0";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "100 100";
     visalphafunc_s = "BLEND";
     visalphaend = 255;
};

INSTANCE OLD_MFX_BREATHOFDEATH_CAST (C_PARTICLEFX)
{
     ppsvalue = 60.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "50";
     shpscalekeys_s = "1 10";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     dirmode_s = "DIR";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "1000 0 0";
     velavg = 2.000000000;
     velvar = 0.500000000;
     lsppartavg = 1000.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 0.0001 0";
     visname_s = "GROUNDFOG.TGA";
     visorientation_s = "NONE";
     vistexanifps = 3.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 0 0";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "5 5";
     vissizeendscale = 150.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
     trltexture_s = "WHITECLOUD.TGA";
};

INSTANCE MFX_BREATHOFDEATH_CASTDUMMY (C_PARTICLEFX)
{
     ppsvalue = 30.000000000;
     ppsscalekeys_s = "5";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.100000001;
     shpisvolume = 1;
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.008000000;
     velvar = 0.029999999;
     lsppartavg = 500.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "LIGHTNING_BIG_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "0 255 255";
     vissizestart_s = "6 6";
     vissizeendscale = 4.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};


INSTANCE OLD_MFX_BREATHOFDEATH_COLLIDE (C_PARTICLEFX)
{
     ppsvalue = 20.000000000;
     ppsscalekeys_s = "1 1 0.7 0.7 0.4 0.4";
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "400";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.100000001;
     velvar = 0.020000000;
     lsppartavg = 2000.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "GROUNDFOG.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 0 0";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "300 300";
     vissizeendscale = 0.100000001;
     visalphafunc_s = "BLEND";
     visalphaend = 255.000000000;
};



///   													XXXXXXXXXXXXXXXXXX
///   													XX  D A N C E   XX
///   													XXXXXXXXXXXXXXXXXX


///   													XXXXXXXXXXXXXXXXXXXX
///   													XX  S H R I N K   XX
///   													XXXXXXXXXXXXXXXXXXXX


INSTANCE MFX_SHRINK_INIT (C_PARTICLEFX)
{
     ppsvalue = 1000.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.000100000;
     lsppartavg = 200.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_LIGHT_SINGLERAY2.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 255 0";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "2 10";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};



INSTANCE MFX_SHRINK_TARGET (C_PARTICLEFX)
{
     ppsvalue = 60.000000000;
     ppsscalekeys_s = "3 3 2 2 1";
     ppsfps = 1.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 -40 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 1.000000000;
     shpdim_s = "40";
     shpscalekeys_s = "1 4 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.000010000;
     velvar = 0.000100000;
     lsppartavg = 1000.000000000;
     flygravity_s = "0 0 0";
     visname_s = "MFX_LIGHT_SINGLERAY.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 0 0";
     vistexcolorend_s = "200 255 200";
     vissizestart_s = "30 400";
     vissizeendscale = 3.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};



///   													XXXXXXXXXXXXXXXXXXXXXX
///   													XX  U N D R E S S   XX
///   													XXXXXXXXXXXXXXXXXXXXXX




///   													XXXXXXXXXXXXXXXXXXXX
///   													XXXXXXXXXXXXXXXXXXXX
///   													XX  G L O B A L   XX
///   													XXXXXXXXXXXXXXXXXXXX
///   													XXXXXXXXXXXXXXXXXXXX


// HUMAN oder VOB brennt nach Feuerschaden

INSTANCE MFX_FIRESPELL_HUMANBURN (C_PARTICLEFX)
{
     ppsvalue = 10;
     ppsscalekeys_s = "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1";
     ppsissmooth = 1;
     ppsfps = 6;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "15 5 5";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "DIR";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 400";
     dirangleelev = 90;
     velavg = 0.100000001;
     lsppartavg = 500;
     flygravity_s = "0 0 0";
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 200 100";
     vistexcolorend_s = "255 150 100";
     vissizestart_s = "10 10";
     vissizeendscale = 5;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     visalphaend = 100;
};


INSTANCE MFX_Firespell_HUMANSMOKE (C_PARTICLEFX)
{
     ppsvalue = 3.000000000;
     ppsscalekeys_s = "1 2 3 4 3 2 2 2 2 1 1 1 1 1 1";
     ppsissmooth = 1;
     ppsfps = 1;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "25";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirangleheadvar = 50.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0.039999999;
     lsppartavg = 5500.000000000;
     lsppartvar = 400.000000000;
     flygravity_s = "0 0 0";
     visname_s = "FIRESMOKE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "140 140 140";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 20";
     vissizeendscale = 2.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 150.000000000;
};

// HUMAN oder VOB brennt nach Magie-Feuerschaden

INSTANCE MFX_MAGICFIRE_HUMANBURN_SHORT (C_PARTICLEFX)
{
     ppsvalue = 20;
     ppsscalekeys_s = "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1";
     ppsissmooth = 1;
     ppsfps = 4;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "30 5 5";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "DIR";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 400";
     dirangleelev = 90;
     velavg = 0.100000001;
     lsppartavg = 500;
     lsppartvar = 50;
     flygravity_s = "0 0.0002 0";
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5;
     vistexaniislooping = 1;
     vistexcolorstart_s = "100 0 255";
     vistexcolorend_s = "255 255 0";
     vissizestart_s = "5 5";
     vissizeendscale = 30;
     visalphafunc_s = "ADD";
     visalphastart = 255;
};


INSTANCE MFX_MAGICFIRE_HUMANBURN (C_PARTICLEFX)
{
     ppsvalue = 10;
     ppsscalekeys_s = "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1";
     ppsissmooth = 1;
     ppsfps = 6;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "15 5 5";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "DIR";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 400";
     dirangleelev = 90;
     velavg = 0.100000001;
     lsppartavg = 500;
     flygravity_s = "0 0 0";
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 200 100";
     vistexcolorend_s = "255 150 100";
     vissizestart_s = "10 10";
     vissizeendscale = 5;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     visalphaend = 100;
};


INSTANCE MFX_MAGICFire_HUMANSMOKE (C_PARTICLEFX)
{
     ppsvalue = 3.000000000;
     ppsscalekeys_s = "1 2 3 4 3 2 2 2 2 1 1 1 1 1 1";
     ppsissmooth = 1;
     ppsfps = 1;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "25";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirangleheadvar = 50.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0.039999999;
     lsppartavg = 5500.000000000;
     lsppartvar = 400.000000000;
     flygravity_s = "0 0 0";
     visname_s = "FIRESMOKE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "140 140 140";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 20";
     vissizeendscale = 2.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 150.000000000;
};


// Carsten:


INSTANCE PFX2(C_PARTICLEFX)
{
     ppsvalue = 40.;
     ppsscalekeys_s = "1 0";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 10.;
     //ppscreateem_s = "CIRLCLE1";
     shptype_s = "MESH";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "100";
     shpscalekeys_s = "0 1 0.5 2";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1.;
     dirmode_s = "DIR";
     dirfor_s = "mesh";
     lsppartavg = 600.;
     lsppartvar = 100.;
     visname_s = "PFXFLARE2_A0.TGA";
     vistexisquadpoly = 1;
     vistexanifps = 10.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 150 150";
     vistexcolorend_s = "100 100 100";
     vissizestart_s = "9 9";
     vissizeendscale = 4.;
     visalphafunc_s = "ADD";
     visalphastart = 80.;
};
INSTANCE HUMAN1(C_PARTICLEFX)
{
     ppsvalue = 20.;
	 ppsislooping = 0;
	 ppsfps   = 0.4;
	 ppsScaleKeys_S = "1.0";
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 3.00000014e-004;
     shpisvolume = 1;
     shpdim_s = "40";
     dirmode_s = "DIR";
     dirfor_s = "object";
     lsppartavg = 800.;
     lsppartvar = 200.;
     vistexisquadpoly = 1;
     visname_s = "pfxflare2_a0.TGA";
     vistexanifps = 10.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 150 150";
     vistexcolorend_s = "100 100 100";
     vissizestart_s = "50 50";
     vissizeendscale = 3.;
     visalphafunc_s = "ADD";
     visalphastart = 100.;
};
INSTANCE HUMAN2(C_PARTICLEFX)
{
     ppsvalue = 15.;
	 ppsislooping = 0;
	 ppsfps   = 0.4;
	 ppsScaleKeys_S = "1.0";
     shptype_s = "box";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 3.00000014e-004;
     shpisvolume = 1;
     shpdim_s = "40 60 20";
     dirmode_s = "DIR";
     dirfor_s = "object";
     lsppartavg = 1000.;
     lsppartvar = 200.;
     vistexisquadpoly = 1;
     visname_s = "cflarestar_a0.TGA";
     vistexanifps = 10.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "180 150 255";
     vistexcolorend_s = "100 100 100";
     vissizestart_s = "50 50";
     vissizeendscale = 3.;
     visalphafunc_s = "ADD";
     visalphastart = 80.;
};

INSTANCE HUMAN_ELECTRIC(C_PARTICLEFX)
{
     ppsvalue = 20.;
	 ppsislooping = 0;
	 ppsfps   = 0.4;
	 ppsScaleKeys_S = "1.0";
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 3.00000014e-004;
     shpisvolume = 1;
     shpdim_s = "40";
     dirmode_s = "DIR";
     dirfor_s = "object";
     lsppartavg = 800.;
     lsppartvar = 200.;
     vistexisquadpoly = 1;
     visname_s = "pfxflare2_a0.TGA";
     vistexanifps = 10.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 150 150";
     vistexcolorend_s = "100 100 100";
     vissizestart_s = "50 50";
     vissizeendscale = 3.;
     visalphafunc_s = "ADD";
     visalphastart = 100.;
};
INSTANCE WALL1(C_PARTICLEFX)
{
     ppsvalue = 20.;
	 ppsislooping = 0;
	 ppsfps   = 0.8;
	 ppsScaleKeys_S = "1.0";
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 3.00000014e-004;
     shpisvolume = 1;
     shpdim_s = "40";
     dirmode_s = "DIR";
     dirfor_s = "object";
     lsppartavg = 800.;
     lsppartvar = 200.;
     vistexisquadpoly = 1;
     visname_s = "pfxflare2_a0.TGA";
     vistexanifps = 10.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 150 150";
     vistexcolorend_s = "100 100 100";
     vissizestart_s = "50 50";
     vissizeendscale = 3.;
     visalphafunc_s = "ADD";
     visalphastart = 100.;
};
INSTANCE SMOKE1 (C_PARTICLEFX)
{
     ppsvalue = 9.;
     ppsscalekeys_s = "1 0.2 1.1 0.6 0.8 1.2 1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.;
     shptype_s = "BOX";
     shpfor_s = "world";
     shpisvolume = 1;
     shpdim_s = "50 50 50";
     shpscalekeys_s = "1 2 0.7 2 0.4 0.1 1.4 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1.;
     dirmode_s = "DIR";
     lsppartavg = 800.;
     lsppartvar = 200.;
     flygravity_s = "0 0.001 0";
     visname_s = "PUFF5.TGA";
     vistexisquadpoly = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "10 20";
     vissizeendscale = 10.;
     visalphafunc_s = "MUL";
};

INSTANCE EXPLOSION1 (C_PARTICLEFX)
{
     ppsvalue = 15.;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsfps = 0.5;
     ppscreateem_s = "ZZTEST_EXPL_DEBRIS";
     shptype_s = "BOX";
     shpdim_s = "30 30 30";
     dirmode_s = "DIR";
     dirfor_s = "object";
     lsppartavg = 750.;
     lsppartvar = 550.;
     flygravity_s = "0 -0.0003 0";
     visname_s = "pfxfexp2_a0.TGA";
     vistexisquadpoly = 1;
     vistexanifps = 17.;

     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "20 20";
     vissizeendscale = 1.;
     visalphafunc_s = "ADD";
     visalphastart = 100.;
};
INSTANCE EXPLOSION2 (C_PARTICLEFX)
{
     ppsvalue = 15.;
     ppsscalekeys_s = "1";
	 ppsislooping = 0;
     ppsfps = 0.5;
     ppscreateem_s = "ZZTEST_EXPL_DEBRIS";
     shptype_s = "BOX";
     shpdim_s = "30 30 30";
     dirmode_s = "DIR";
     dirfor_s = "object";
     lsppartavg = 750.;
     lsppartvar = 550.;
     flygravity_s = "0 -0.0003 0";
     visname_s = "pfxfexp2_a0.TGA";
     vistexisquadpoly = 1;
     vistexanifps = 17.;

     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "40 40";
     vissizeendscale = 1.;
     visalphafunc_s = "ADD";
     visalphastart = 100.;
};
INSTANCE EXPLOSION3 (C_PARTICLEFX)
{
     ppsvalue = 15.;
     ppsscalekeys_s = "1";
	 ppsislooping = 0;
     ppsfps = 0.5;
     ppscreateem_s = "ZZTEST_EXPL_DEBRIS";
     shptype_s = "BOX";
     shpdim_s = "30 30 30";
     dirmode_s = "DIR";
     dirfor_s = "object";
     lsppartavg = 750.;
     lsppartvar = 550.;
     flygravity_s = "0 -0.0003 0";
     visname_s = "pfxfexp2_a0.TGA";
     vistexisquadpoly = 1;
     vistexanifps = 17.;

     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "70 70";
     vissizeendscale = 1.;
     visalphafunc_s = "ADD";
     visalphastart = 100.;
};

INSTANCE FB2 (C_PARTICLEFX)
{
     ppsvalue = 5.;
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 3.00000014e-004;
     shpisvolume = 1;
     shpdim_s = "8";
     dirmode_s = "DIR";
     dirfor_s = "object";
     lsppartavg = 9.99999983e+012;
     visname_s = "fireball_a0.tga";
     vistexisquadpoly = 1;
     vistexanifps = 17.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "100 100 100";
     vissizestart_s = "30 30";
     vissizeendscale = 3.;
     visalphafunc_s = "ADD";
     visalphastart = 100.;
};
INSTANCE NEW(C_PARTICLEFX)
{
     ppsvalue = 1.;
     ppsislooping = 0;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "10";
     shpscalekeys_s = "1 15";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1;
     dirmode_s = "DIR";
     dirfor_s = "OBJECT";
     lsppartavg = 1500.;
     lsppartvar = 0.;
     visname_s = "PFXFLARE2_A0.TGA";
     vistexisquadpoly = 1;
     vistexanifps = 10.;
     vistexaniislooping = 0;
     vistexcolorstart_s = "150 150 150";
     vistexcolorend_s = "100 100 100";
     vissizestart_s = "50 50";
     vissizeendscale = 15.;
     visalphafunc_s = "ADD";
     visalphastart = 255.;
	 visalphaend   = 100.;
};

INSTANCE FBNEW (C_PARTICLEFX)
{
     ppsvalue = 1.;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpisvolume = 1;
     shpdim_s = "3";
     dirmode_s = "DIR";
     lsppartavg = 6.00000011e+013;
     flygravity_s = "0 0 0";
     visname_s = "fireball_a0.tga";
     vistexisquadpoly = 1;
     vistexanifps = 17.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "180 180 50";
     vistexcolorend_s = "150 0 0";
     vissizestart_s = "5 5";
     vissizeendscale = 4.;
     visalphafunc_s = "ADD";
     visalphastart = 255.;
};
INSTANCE FB_TAIL(C_PARTICLEFX)
{
 /*    ppsvalue = 40.;
     //ppsscalekeys_s = "1 0";
     ppsislooping = 1;
     //ppsissmooth = 1;
     //ppsfps = 10.;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 2.00000009e-003;
     shpdim_s = "20";
     shpscalekeys_s = "0 1 0.5 2";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1.;
     dirmode_s = "DIR";
     dirfor_s = "world";
     lsppartavg = 600.;
     lsppartvar = 100.;
     visname_s = "firetail.TGA";
     vistexisquadpoly = 1;
     vistexcolorstart_s = "180 180 50";
     vistexcolorend_s = "150 0 0";
     vissizestart_s = "5 5";
     vissizeendscale = 4.;
     visalphafunc_s = "ADD";
     visalphastart = 90.;*/

     ppsvalue = 150.;
     ppsislooping = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "1 0 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.00000005e-003;
     shpisvolume = 1;
     shpdim_s = "5";
     velavg = 0.150000006;
     velvar = 5.00000007e-002;
     lsppartavg = 100.;
     lsppartvar = 350.;
     flygravity_s = "0 -0.0001 0";
     visname_s = "FIRETAIL.TGA";
     visorientation_s = "VELO";
	 vistexisquadpoly = 1;
     vistexcolorstart_s = "180 180 50";
     vistexcolorend_s = "150 0 0";
     vissizestart_s = "12 20";
     vissizeendscale = 2.50000004e-002;
     visalphafunc_s = "ADD";
     visalphastart = 255.;


};

INSTANCE FB_TAIL2(C_PARTICLEFX)
{
     ppsvalue = 40.;
     //ppsscalekeys_s = "1 0";
     ppsislooping = 1;
     //ppsissmooth = 1;
     //ppsfps = 10.;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 2.00000009e-003;
     shpdim_s = "20";
     shpscalekeys_s = "0 1 0.5 2";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1.;
     dirmode_s = "DIR";
     dirfor_s = "world";
     lsppartavg = 600.;
     lsppartvar = 100.;
     visname_s = "firetail.TGA";
     vistexisquadpoly = 1;
     vistexcolorstart_s = "180 180 50";
     vistexcolorend_s = "150 0 0";
     vissizestart_s = "5 5";
     vissizeendscale = 4.;
     visalphafunc_s = "ADD";
     visalphastart = 90.;

};

INSTANCE FB3 (C_PARTICLEFX)
{
     ppsvalue = 80.;
     ppsislooping = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpisvolume = 1;
     shpdim_s = "3";
     dirmode_s = "DIR";
     lsppartavg = 600.;
     lsppartvar = 200.;
     flygravity_s = "0 0 0";
     visname_s = "fireball_a0.tga";
     vistexisquadpoly = 1;
     vistexcolorstart_s = "255 180 50";
     vistexcolorend_s = "150 0 0";
     vissizestart_s = "12 12";
     vissizeendscale = 0.5;
     visalphafunc_s = "ADD";
     visalphastart = 80.;
};

INSTANCE CAST1 (C_PARTICLEFX)
{
     ppsvalue = 150.;
     ppsscalekeys_s = "1.0";
     ppsfps = 1.5;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "1 0 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.00000005e-003;
     shpisvolume = 1;
     shpdim_s = "5";
     velavg = 0.150000006;
     velvar = 5.00000007e-002;
     lsppartavg = 400.;
     lsppartvar = 350.;
     flygravity_s = "0 -0.0001 0";
     visname_s = "PFXFLARE2_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "180 180 50";
     vistexcolorend_s = "150 0 0";
     vissizestart_s = "15 20";
     vissizeendscale = 2.50000004e-002;
     visalphafunc_s = "ADD";
     visalphastart = 200.;
};
INSTANCE CAST2 (C_PARTICLEFX)
{
     ppsvalue = 150.;
     ppsscalekeys_s = "1.0";
     ppsfps = 1.5;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "1 0 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.00000005e-003;
     shpisvolume = 1;
     shpdim_s = "30";
     velavg = 0.150000006;
     velvar = 5.00000007e-002;
     lsppartavg = 400.;
     lsppartvar = 350.;
     flygravity_s = "0 -0.0001 0";
     visname_s = "PFXFLARE2_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "180 180 50";
     vistexcolorend_s = "150 0 0";
     vissizestart_s = "30 30";
     vissizeendscale = 2.50000004e-002;
     visalphafunc_s = "ADD";
     visalphastart = 200.;
};

INSTANCE CAST3 (C_PARTICLEFX)
{
     ppsvalue = 50.;
     ppsscalekeys_s = "1.0";
     ppsislooping = 0;
     ppsfps = 1;
     shptype_s = "LINE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RANDOM";
     shpdistribwalkspeed = 1.00000005e-003;
     shpdim_s = "30";
     shpscalekeys_s = "0 1 2 0.4 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     velvar = 5.00000007e-002;
     lsppartavg = 800.;
     lsppartvar = 350.;
     flygravity_s = "0 0 0";
     visname_s = "PFX6_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 100 100";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "30 30";
     vissizeendscale = 2.50000004e-002;
     visalphafunc_s = "ADD";
     visalphaend = 255.;
};

INSTANCE BLAST(C_PARTICLEFX)
{
     ppsvalue = 10.;
     ppsscalekeys_s = "3 2 1";
	 //ppsIsLooping = 1;
	 ppsfps = 1;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.00000005e-003;
     shpdim_s = "80";
     shpscalekeys_s = "0 1 0.5 2";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1.;
     dirmode_s = "DIR";
     dirfor_s = "world";
     lsppartavg = 800.;
     lsppartvar = 100.;
     visname_s = "PFX6_A0.TGA";
     vistexisquadpoly = 1;
     vistexanifps = 10.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 100 100";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "20 20";
     vissizeendscale = 4.;
     visalphafunc_s = "ADD";
     visalphastart = 150.;
     visalphaend = 50.;
};

INSTANCE CAST4 (C_PARTICLEFX)
{
     ppsvalue = 50.;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsfps = 1.;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RANDOM";
     shpdistribwalkspeed = 1.00000005e-003;
     shpdim_s = "30 100 30";
     shpscalekeys_s = "0 1 2 0.4 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     velvar = 5.00000007e-002;
     lsppartavg = 800.;
     lsppartvar = 350.;
     flygravity_s = "0 0 0";
     visname_s = "ALIEN0000.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 100 100";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "30 30";
     vissizeendscale = 2.50000004e-002;
     visalphafunc_s = "ADD";
     visalphaend = 255.;
};
INSTANCE CAST6 (C_PARTICLEFX)
{
     ppsvalue = 150.;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsfps = 1.;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.00000005e-003;
     shpdim_s = "600 0 600";
     shpscalekeys_s = "0 1 2 0.4 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     velavg = 1.99999995e-004;
     lsppartavg = 6000.;
     lsppartvar = 1000.;
     flygravity_s = "0 -0.00004 0";
     flycolldet_b = 0;
     visname_s = "FLARESTAR.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "100 50 33";
     vissizestart_s = "50 50";
     vissizeendscale = 2.50000004e-002;
     visalphafunc_s = "ADD";
     visalphastart = 255.;
     visalphaend = 50.;
};
INSTANCE CAST7 (C_PARTICLEFX)
{
     ppsvalue = 150.;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsfps = 1.;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RANDOM";
     shpdistribwalkspeed = 1.00000005e-003;
     shpisvolume = 1;
     shpdim_s = "50 50 ";
     shpscalekeys_s = "0 1 2 0.4 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 5.;
     dirangleheadvar = 360.;
     dirangleelevvar = 360.;
     velavg = 9.99999978e-003;
     velvar = 5.00000007e-002;
     lsppartavg = 2000.;
     lsppartvar = 350.;
     flygravity_s = "0 0.00004 0";
     visname_s = "DEMONSIGN.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 80 0";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "50 10";
     vissizeendscale = 2.50000004e-002;
     visalphafunc_s = "ADD";
     visalphaend = 200.;
};

INSTANCE CAST10 (C_PARTICLEFX)
{
     ppsvalue = 150.;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsfps = 1.;
     ppscreateem_s = "CAST9";
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RANDOM";
     shpdistribwalkspeed = 1.00000005e-003;
     shpdim_s = "15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "DIR";
     dirangleelev = 90.;
     dirangleelevvar = 20.;
     velavg = 0.100000001;
     velvar = 5.00000007e-002;
     lsppartavg = 800.;
     lsppartvar = 350.;
     flygravity_s = "0 0 0";
     visname_s = "FLAME_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "180 150 80";
     vistexcolorend_s = "100 0 0 ";
     vissizestart_s = "30 30";
     vissizeendscale = 2.50000004e-002;
     visalphafunc_s = "ADD";
     visalphaend = 255.;
};

INSTANCE BREATH(C_PARTICLEFX)
{
     ppsvalue = 150.;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsfps = 1.;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RANDOM";
     shpdistribwalkspeed = 1.00000005e-003;
     shpdim_s = "30";
     shpscalekeys_s = "0 1 2 0.4 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     velvar = 5.00000007e-002;
     lsppartavg = 800.;
     lsppartvar = 350.;
     flygravity_s = "0 0 0";
     visname_s = "ALIEN0000.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 100 100";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "30 30";
     vissizeendscale = 2.50000004e-002;
     visalphafunc_s = "ADD";
     visalphaend = 255.;
};

INSTANCE WaterFX(C_PARTICLEFX)
{
     ppsvalue = 150.;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsfps = 1.;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.00000005e-003;
     shpdim_s = "200";
     shpscalekeys_s = "0 1 2 0.4 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     velavg = 1.99999995e-004;
     lsppartavg = 2000.;
     lsppartvar = 350.;
     flygravity_s = "0 0.0002 0";
     visname_s = "FLARESTAR.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "100 50 33";
     vissizestart_s = "50 50";
     vissizeendscale = 2.50000004e-002;
     visalphafunc_s = "ADD";
     visalphaend = 255.;
};

INSTANCE SPELL_MASSDEATH(C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
     ppsislooping = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpdistribtype_s = "UNIFORM";
     shpdistribwalkspeed = 0.039999999;
     shpisvolume = 1;
     shpdim_s = "20";
     shpscalekeys_s = "1 ";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 3.000000000;
     dirmode_s = "=";
     dirfor_s = "OBJECT";
     dirangleheadvar = 360.000000000;
     lsppartavg = 699.000000000;
     flygravity_s = "0";
     flycolldet_b = 0;
     visname_s = "ELECTRICBLUE0000.TGA";
     vistexisquadpoly = 1;
     vistexanifps = 10.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "8 8 ";
     vissizeendscale = 8.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 100.000000000;
     trlfadespeed = 0.200000003;
     trltexture_s = "ZPLASMA0.TGA";
};

INSTANCE SPELL_MASSDEATH_INVEST(C_PARTICLEFX)
{
     ppsvalue = 30.000000000;
     ppsislooping = 0;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpdim_s = "10";
     shpscalekeys_s = "1 ";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 3.000000000;
     dirmode_s = "=";
     dirfor_s = "OBJECT";
     dirangleheadvar = 360.000000000;
     velavg = 0.300000012;
     lsppartavg = 3000.000000000;
     flygravity_s = "0 -0.0001 0 ";
     flycolldet_b = 1;
     visname_s = "ELECTRICBLUE0000.TGA";
     vistexisquadpoly = 1;
     vistexanifps = 10.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "5 5";
     vissizeendscale = 8.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 150.000000000;
     trlfadespeed = 0.200000003;
     trltexture_s = "ZPLASMA0.TGA";
     trlwidth = 10.000000000;
};


INSTANCE SMOKE_JOINT_SLOW_TIME (C_PARTICLEFX)
{
     ppsvalue = 300;
     ppsscalekeys_s = "1 1 1";
     ppsissmooth = 1;
     ppsfps = 10;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "UNIFORM";
     shpdim_s = "10";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleissmooth = 1;
     dirmode_s = "RAND";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 0.00999999978;
     lsppartavg = 2000;
     lsppartvar = 100;
     flygravity_s = "0 0 0";
     visname_s = "HEAVENLIGHT.TGA";
     visorientation_s = "VELO3D";
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 255 100";
     vistexcolorend_s = "255 0 100";
     vissizestart_s = "2 50";
     vissizeendscale = 30;
     visalphafunc_s = "ADD";
     visalphastart = 150;
     useemittersfor = 1;
};

//ADDON
//InExtremo Pauke

INSTANCE PaukeFX (C_PARTICLEFX)//ADDON
{
     ppsvalue = 100.000000000;
     ppsscalekeys_s = "10";
     ppsissmooth = 1;
     ppsfps = 1;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "65";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirangleheadvar = 50.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0.25;
     lsppartavg = 1200.000000000;
     lsppartvar = 700.000000000;
     flygravity_s = "0 0 0";
     visname_s = "FIRESMOKE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "120 120 120";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 20";
     vissizeendscale = 2.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};


////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
///
///		Modell/Item-Effekte (Addon)
///
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////


INSTANCE FIRE_MODEL (C_PARTICLEFX)
{
	ppsvalue			= 600;
	ppsscalekeys_s		= "1.0";
	ppsislooping		= 1;
	ppsfps				= 1;
	shptype_s			= "MESH";
	shpfor_s			= "OBJECT";
	shpoffsetvec_s		= "0 0 0";
	shpdistribtype_s	= "RANDOM";
	shpdim_s			= "7";
//	shpmesh_s			= "HUMANS.MDS";
	shpscalekeys_s		= "1";
	shpscaleislooping	= 1;
	shpscaleissmooth	= 1;
	shpscalefps			= 2;
	dirmode_s			= "NONE";
	velavg				= 9.99999996e-012;
	lsppartavg			= 350;
	flygravity_s		= "0 0.000 0";
	visname_s			= "HUMANBURN.TGA";
	visorientation_s	= "VELO3D";
	vistexisquadpoly	= 1;
	vistexanifps		= 15;
	vistexaniislooping	= 1;
	vistexcolorstart_s	= "255 255 255";
	vistexcolorend_s	= "255 200 200";
	vissizestart_s		= "5 5";
	vissizeendscale		= 10;
	visalphafunc_s		= "ADD";
	visalphastart		= 255;
	flockmode			= "ARMOR_XARDAS.ASC";
	useemittersfor		= 0;
};


INSTANCE UNDEAD_DRAGON (C_PARTICLEFX)
{
     ppsvalue = 800;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsfps = 1;
     shptype_s = "MESH";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 100;
     shpdim_s = "7";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "NONE";
     velavg = 9.99999996e-012;
     lsppartavg = 1000;
     flygravity_s = "0 0.000 0";
     visname_s = "DESTROYUNDEAD3.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 0;
     vistexaniislooping = 2;
     vistexcolorstart_s = "0 150 0";
     vistexcolorend_s = "155 50 150";
     vissizestart_s = "10 10";
     vissizeendscale = 7;
     visalphafunc_s = "ADD";
     visalphastart = 255;
};

        
        
/*  backup 

INSTANCE FIRE_MODEL (C_PARTICLEFX)
{
	ppsvalue			= 600;
	ppsscalekeys_s		= "1.0";
	ppsislooping		= 1;
	ppsfps				= 1;
	shptype_s			= "MESH";
	shpfor_s			= "OBJECT";
	shpoffsetvec_s		= "0 0 0";
	shpdistribtype_s	= "RANDOM";
	shpdim_s			= "7";
//	shpmesh_s			= "HUMANS.MDS";
	shpscalekeys_s		= "1";
	shpscaleislooping	= 1;
	shpscaleissmooth	= 1;
	shpscalefps			= 2;
	dirmode_s			= "NONE";
	velavg				= 9.99999996e-012;
	lsppartavg			= 350;
	flygravity_s		= "0 0.000 0";
	visname_s			= "HUMANBURN.TGA";
	visorientation_s	= "VELO3D";
	vistexisquadpoly	= 1;
	vistexanifps		= 15;
	vistexaniislooping	= 1;
	vistexcolorstart_s	= "255 255 255";
	vistexcolorend_s	= "255 200 200";
	vissizestart_s		= "5 5";
	vissizeendscale		= 10;
	visalphafunc_s		= "ADD";
	visalphastart		= 255;
	flockmode			= "ARMOR_XARDAS.ASC";
	useemittersfor		= 0;
};

*/
        

INSTANCE FIRE_MODEL_KAIRO (C_PARTICLEFX)
{
     ppsvalue = 180;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsfps = 1;
     shptype_s = "MESH";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RANDOM";
     shpdim_s = "7";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     velavg = 0.00999999978;
     lsppartavg = 1200;
     lsppartvar = 200;
     flygravity_s = "0 0 0";
     visname_s = "SHADOWBEAST_FIRE.TGA";
     visorientation_s = "VELO";
     vistexanifps = 15;
     vistexaniislooping = 2;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 20";
     vissizeendscale = 5;
     visalphafunc_s = "ADD";
     visalphastart = 255;
};


INSTANCE SMOKE_MODEL_KAIRO (C_PARTICLEFX)
{
     ppsvalue = 15;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsfps = 1;
     shptype_s = "MESH";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RANDOM";
     shpdim_s = "7";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "DIR";
     dirangleheadvar = 5;
     dirangleelev = -90;
     dirangleelevvar = 5;
     velavg = 0.00039999999;
     lsppartavg = 1500;
     flygravity_s = "0 0.0001 0";
     visname_s = "SHADOWBEAST_SMOKE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 15;
     vistexaniislooping = 2;
     vistexcolorstart_s = "0 0 0";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "20 40";
     vissizeendscale = 5;
     visalphafunc_s = "BLEND";
     visalphastart = 255;
     flockmode = "ARMOR_XARDAS.ASC";
};

                                   
////////////////////////////////////////////////////////////////////////////////

PROTOTYPE FIRE_SWORD_PROTO (C_PARTICLEFX)
{
	ppsvalue			= 150.000000000;
	ppsscalekeys_s		= "1.0";
	ppsislooping		= 1;
	ppsfps				= 1.000000000;
	shptype_s			= "MESH";
//	shpmesh_s			= "ITMW_BELIARWEAPON_2H.ASC";
	shpfor_s			= "OBJECT";
	shpoffsetvec_s		= "=";
	shpdistribtype_s	= "UNIFORM";
	shpdim_s			= "7";
	shpscalekeys_s		= "1";
	shpscaleislooping	= 1;
	shpscaleissmooth	= 1;
	shpscalefps			= 2.000000000;
	dirmode_s			= "MESH";
	dirangleheadvar		= 180.000000000;
	dirangleelev		= 90.000000000;
	dirangleelevvar		= 20.000000000;
	velavg				= 0.100000001;
	lsppartavg			= 300.000000000;
	flygravity_s		= "0 0.0003 0";
	visname_s			= "HUMANBURN.TGA";
	visorientation_s	= "VELO";
	vistexisquadpoly	= 1;
	vistexanifps		= 15.000000000;
	vistexaniislooping	= 1;
	vistexcolorstart_s	= "255 255 255";
	vistexcolorend_s	= "255 200 200";
	vissizestart_s		= "5 5";
	vissizeendscale		= 10.000000000;
	visalphafunc_s		= "ADD";
	visalphastart		= 255.000000000;
//	trlTexture_S		= "XBEAM1.TGA";
//	trlFadeSpeed		= 0.3;
//	trlWidth			= 3;
};
////////////////////////////////////////////////////////////////////////////////

INSTANCE FIRE_SWORD (FIRE_SWORD_PROTO)
{
};

INSTANCE PFX_BELIARWEAPON_1H (FIRE_SWORD_PROTO)
{
    ppscreateem_s = "PFX_BELIARWEAPON_1H_BLADE";
};
INSTANCE PFX_BELIARWEAPON_1H_BLADE (C_PARTICLEFX)
{
	shpmesh_s	= "ItPFX_BeliarWeapon_1H_BLADE.3DS";
    ppscreateem_s = "PFX_BELIARWEAPON_1H_EYES";
 	visname_s	 = "lightbolt_A0.tga";
};
INSTANCE PFX_BELIARWEAPON_1H_EYES (C_PARTICLEFX)
{
	shpmesh_s	= "ItPFX_BeliarWeapon_1H_EYES.3DS";
	visname_s	 = "BLUEGLOW.TGA";
};
INSTANCE PFX_BELIARWEAPON_2H (FIRE_SWORD_PROTO)
{
	shpmesh_s	= "ItPFX_BeliarWeapon_2H_BLADE.3DS";
};

INSTANCE PFX_BELIARWEAPON_2H_BLADE (C_PARTICLEFX)
{
	shpmesh_s	= "ItPFX_BeliarWeapon_2H_BLADE.3DS";
};
INSTANCE PFX_BELIARWEAPON_2H_EYES (C_PARTICLEFX)
{
	shpmesh_s	= "ItPFX_BeliarWeapon_2H_EYES.3DS";
};

INSTANCE FIRE_SWORDBLACK (FIRE_SWORD_PROTO)
{
	ppsvalue			= 150.000000000;
	ppsscalekeys_s		= "1.0";
	ppsislooping		= 1;
	ppsfps				= 1.000000000;
	shptype_s			= "MESH";
//	shpmesh_s			= "ITMW_BELIARWEAPON_2H.ASC";
	shpfor_s			= "OBJECT";
	shpoffsetvec_s		= "=";
	shpdistribtype_s	= "UNIFORM";
	shpdim_s			= "7";
	shpscalekeys_s		= "1";
	shpscaleislooping	= 1;
	shpscaleissmooth	= 1;
	shpscalefps			= 2.000000000;
	dirmode_s			= "MESH";
	dirangleheadvar		= 180.000000000;
	dirangleelev		= 90.000000000;
	dirangleelevvar		= 20.000000000;
	velavg				= 0.100000001;
	lsppartavg			= 300.000000000;
	flygravitY_s		= "0 0.0003 0";
	visname_s			= "MFX_breathofdeath.tga";
	visorientation_s	= "VELO";
	vistexisquadpoly	= 1;
	vistexanifps		= 15.000000000;
	vistexaniislooping	= 1;
	vistexcolorstart_s	= "100 100 100";
	vistexcolorend_s	= "100 100 100";
	vissizestart_s		= "5 5";
	vissizeendscale		= 2.000000000;
	visalphafunc_s		= "BLEND";
	visalphastart		= 255.000000000;
//	trlTexture_S		= "XBEAM1.TGA";
//	trlFadeSpeed		= 0.3;
//	trlWidth			= 3;
};

INSTANCE FIRE_SWORD_ATTACK (C_PARTICLEFX)
{
	ppsvalue			= 300.000000000;
	ppsscalekeys_s		= "1.0";
	ppsislooping		= 1;
	ppsfps				= 1.000000000;
	shptype_s			= "MESH";
//	shpmesh_s			= "ITMW_BELIARWEAPON_2H.ASC";
	shpfor_s			= "OBJECT";
	shpoffsetvec_s		= "=";
	shpdistribtype_s	= "UNIFORM";
	shpdim_s			= "7";
	shpscalekeys_s		= "1";
	shpscaleislooping	= 1;
	shpscaleissmooth	= 1;
	shpscalefps			= 2.000000000;
	dirmode_s			= "MESH";
	dirangleheadvar		= 180.000000000;
	dirangleelev		= 90.000000000;
	dirangleelevvar		= 20.000000000;
	velavg				= 0.100000001;
	lsppartavg			= 400.000000000;
	flygravity_s		= "0 0.0003 0";
	visname_s			= "HUMANBURN.TGA";
	visorientation_s	= "VELO";
	vistexisquadpoly	= 1;
	vistexanifps		= 15.000000000;
	vistexaniislooping	= 1;
	vistexcolorstart_s	= "255 255 255";
	vistexcolorend_s	= "255 200 200";
	vissizestart_s		= "5 5";
	vissizeendscale		= 10.000000000;
	visalphafunc_s		= "ADD";
	visalphastart		= 255.000000000;
//	trlTexture_S		= "XBEAM1.TGA";
//	trlFadeSpeed		= 0.3;
//	trlWidth			= 3;
};

INSTANCE FIRE_SWORD_HIT (C_PARTICLEFX)
{
	ppsvalue			= 300.000000000;
	ppsscalekeys_s		= "1.0";
	ppsislooping		= 1;
	ppsfps				= 1.000000000;
	shptype_s			= "MESH";
//	shpmesh_s			= "ITMW_BELIARWEAPON_2H.ASC";
	shpfor_s			= "OBJECT";
	shpoffsetvec_s		= "=";
	shpdistribtype_s	= "UNIFORM";
	shpdim_s			= "7";
	shpscalekeys_s		= "1";
	shpscaleislooping	= 1;
	shpscaleissmooth	= 1;
	shpscalefps			= 2.000000000;
	dirmode_s			= "MESH";
	dirangleheadvar		= 180.000000000;
	dirangleelev		= 90.000000000;
	dirangleelevvar		= 20.000000000;
	velavg				= 0.100000001;
	lsppartavg			= 400.000000000;
	flygravity_s		= "0 0.0003 0";
	visname_s			= "HUMANBURN.TGA";
	visorientation_s	= "VELO";
	vistexisquadpoly	= 1;
	vistexanifps		= 15.000000000;
	vistexaniislooping	= 1;
	vistexcolorstart_s	= "200 40 100";
	vistexcolorend_s	= "0 0 255";
	vissizestart_s		= "5 5";
	vissizeendscale		= 12.000000000;
	visalphafunc_s		= "ADD";
	visalphastart		= 255.000000000;
//	trlTexture_S		= "XBEAM1.TGA";
//	trlFadeSpeed		= 0.3;
//	trlWidth			= 3;
};

////////////////////////////////////////////////////////////////////////////////

INSTANCE MAGIC_BOW (C_PARTICLEFX)
{
	ppsvalue		= 100;
	ppsscalekeys_s		= "1.0";
	ppsislooping		= 1;
	ppsfps			= 1;
	shptype_s		= "MESH";
	shpfor_s		= "OBJECT";
	shpoffsetvec_s		= "0 0 0";
	shpdistribtype_s	= "RANDOM";
	shpdim_s		= "7";
//	shpmesh_s		= "HUMANS.MDS";
	shpscalekeys_s		= "1";
	shpscaleislooping	= 1;
	shpscaleissmooth	= 1;
	shpscalefps			= 2;
	dirmode_s			= "NONE";
	velavg				= 9.99999996e-012;
	lsppartavg			= 300;
	flygravity_s		= "0 0.000 0";
	visname_s			= "ELECTRICBLUE0000.TGA";
	visorientation_s	= "VELO3D";
	vistexisquadpoly	= 1;
	vistexanifps		= 15;
	vistexaniislooping	= 1;
	vistexcolorstart_s	= "255 255 255";
	vistexcolorend_s	= "000 100 255";
	vissizestart_s		= "5 5";
	vissizeendscale		= 10;
	visalphafunc_s		= "ADD";
	visalphastart		= 255;
	useemittersfor		= 0;
};

INSTANCE FIRE_BOW (C_PARTICLEFX)
{
	ppsvalue		= 120.000000000;
	ppsscalekeys_s		= "1.0";
	ppsislooping		= 1;
	ppsfps			= 1.000000000;
	shptype_s		= "MESH";
//	shpmesh_s		= "ITMW_BELIARWEAPON_2H.ASC";
	shpfor_s		= "OBJECT";
	shpoffsetvec_s		= "=";
	shpdistribtype_s	= "UNIFORM";
	shpdim_s		= "7";
	shpscalekeys_s		= "1";
	shpscaleislooping	= 1;
	shpscaleissmooth	= 1;
	shpscalefps		= 2.000000000;
	dirmode_s		= "MESH";
	dirangleheadvar		= 180.000000000;
	dirangleelev		= 90.000000000;
	dirangleelevvar		= 20.000000000;
	velavg			= 0.0100000001;
	lsppartavg		= 400.000000000;
	flygravity_s		= "0 0.000 0";
	visname_s		= "HUMANBURN.TGA";
	visorientation_s	= "VELO";
	vistexisquadpoly	= 1;
	vistexanifps		= 15.000000000;
	vistexaniislooping	= 1;
	vistexcolorstart_s	= "255 255 255";
	vistexcolorend_s	= "255 200 200";
	vissizestart_s		= "5 5";
	vissizeendscale		= 8.000000000;
	visalphafunc_s		= "ADD";
	visalphastart		= 255.000000000;
};


INSTANCE MAGIC_ARROW (C_PARTICLEFX)
{
	ppsvalue		= 50;
	ppsscalekeys_s		= "1.0";
	ppsislooping		= 1;
	ppsfps				= 1;
	shptype_s			= "MESH";
	shpfor_s			= "OBJECT";
	shpoffsetvec_s		= "0 0 0";
	shpdistribtype_s	= "RANDOM";
	shpdim_s			= "7";
//	shpmesh_s			= "HUMANS.MDS";
	shpscalekeys_s		= "1";
	shpscaleislooping	= 1;
	shpscaleissmooth	= 1;
	shpscalefps			= 2;
	dirmode_s			= "NONE";
	velavg				= 9.99999996e-012;
	lsppartavg			= 300;
	flygravity_s		= "0 0.000 0";
	visname_s			= "ELECTRICBLUE0000.TGA";
	visorientation_s	= "VELO3D";
	vistexisquadpoly	= 1;
	vistexanifps		= 15;
	vistexaniislooping	= 1;
	vistexcolorstart_s	= "255 255 255";
	vistexcolorend_s	= "000 100 255";
	vissizestart_s		= "5 5";
	vissizeendscale		= 10;
	visalphafunc_s		= "ADD";
	visalphastart		= 255;
	useemittersfor		= 0;
};

INSTANCE FIRE_ARROW (C_PARTICLEFX)
{
	ppsvalue		= 120.000000000;
	ppsscalekeys_s		= "1.0";
	ppsislooping		= 1;
	ppsfps			= 1.000000000;
	shptype_s		= "MESH";
//	shpmesh_s			= "ITMW_BELIARWEAPON_2H.ASC";
	shpfor_s			= "OBJECT";
	shpoffsetvec_s		= "=";
	shpdistribtype_s	= "UNIFORM";
	shpdim_s		= "7";
	shpscalekeys_s		= "1";
	shpscaleislooping	= 1;
	shpscaleissmooth	= 1;
	shpscalefps		= 2.000000000;
	dirmode_s		= "MESH";
	dirangleheadvar		= 180.000000000;
	dirangleelev		= 90.000000000;
	dirangleelevvar		= 20.000000000;
	velavg			= 0.0100000001;
	lsppartavg		= 400.000000000;
	flygravity_s		= "0 0.0003 0";
	visname_s		= "HUMANBURN.TGA";
	visorientation_s	= "VELO";
	vistexisquadpoly	= 1;
	vistexanifps		= 15.000000000;
	vistexaniislooping	= 1;
	vistexcolorstart_s	= "255 255 255";
	vistexcolorend_s	= "255 200 200";
	vissizestart_s		= "5 5";
	vissizeendscale		= 6.000000000;
	visalphafunc_s		= "ADD";
	visalphastart		= 255.000000000;
//	trlTexture_S		= "XBEAM1.TGA";
//	trlFadeSpeed		= 0.3;
//	trlWidth			= 3;
};


////////////////////////////////////////////////////////////////////////////////

INSTANCE MAGIC_CROSSBOW (C_PARTICLEFX)
{
	ppsvalue			= 100;
	ppsscalekeys_s		= "1.0";
	ppsislooping		= 1;
	ppsfps				= 1;
	shptype_s			= "MESH";
	shpfor_s			= "object";
	shpoffsetvec_s		= "0 0 0";
	shpdistribtype_s	= "RANDOM";
	shpdim_s			= "7";
//	shpmesh_s			= "HUMANS.MDS";
	shpscalekeys_s		= "1";
	shpscaleislooping	= 1;
	shpscaleissmooth	= 1;
	shpscalefps			= 2;
	dirmode_s			= "NONE";
	velavg				= 9.99999996e-012;
	lsppartavg			= 300;
	flygravity_s		= "0 0.000 0";
	visname_s			= "ELECTRICBLUE0000.TGA";
	visorientation_s	= "VELO3D";
	vistexisquadpoly	= 1;
	vistexanifps		= 15;
	vistexaniislooping	= 1;
	vistexcolorstart_s	= "255 255 255";
	vistexcolorend_s	= "000 100 255";
	vissizestart_s		= "5 5";
	vissizeendscale		= 10;
	visalphafunc_s		= "ADD";
	visalphastart		= 255;
	useemittersfor		= 0;
};

INSTANCE MAGIC_BOLT (C_PARTICLEFX)
{
	ppsvalue			= 100;
	ppsscalekeys_s		= "1.0";
	ppsislooping		= 1;
	ppsfps				= 1;
	shptype_s			= "MESH";
	shpfor_s			= "OBJECT";
	shpoffsetvec_s		= "0 0 0";
	shpdistribtype_s	= "RANDOM";
	shpdim_s			= "7";
//	shpmesh_s			= "HUMANS.MDS";
	shpscalekeys_s		= "1";
	shpscaleislooping	= 1;
	shpscaleissmooth	= 1;
	shpscalefps			= 2;
	dirmode_s			= "NONE";
	velavg				= 9.99999996e-012;
	lsppartavg			= 300;
	flygravity_s		= "0 0.000 0";
	visname_s			= "ELECTRICBLUE0000.TGA";
	visorientation_s	= "VELO3D";
	vistexisquadpoly	= 1;
	vistexanifps		= 15;
	vistexaniislooping	= 1;
	vistexcolorstart_s	= "255 255 255";
	vistexcolorend_s	= "000 100 255";
	vissizestart_s		= "5 5";
	vissizeendscale		= 10;
	visalphafunc_s		= "ADD";
	visalphastart		= 255;
	useemittersfor		= 0;
};

////////////////////////////////////////////////////////////////////////////////

PROTOTYPE ITEM_GLIMMER_PROTO (C_PARTICLEFX)
{
	ppsvalue			= 100;
	ppsscalekeys_s		= "1.0";
	ppsislooping		= 1;
	ppsfps				= 1;
	shptype_s			= "MESH";
	shpfor_s			= "OBJECT";
	shpoffsetvec_s		= "0 0 0";
	shpdistribtype_s	= "RANDOM";
	shpdim_s			= "7";
//	shpmesh_s			= "HUMANS.MDS";
	shpscalekeys_s		= "1";
	shpscaleislooping	= 1;
	shpscaleissmooth	= 1;
	shpscalefps			= 2;
	dirmode_s			= "NONE";
	velavg				= 9.99999996e-012;
	lsppartavg			= 300;
	flygravity_s		= "0 0.0000 0";
	visorientation_s	= "VELO3D";
	vistexisquadpoly	= 1;
	vistexanifps		= 15;
	vistexaniislooping	= 1;
	//vistexcolorstart_s	= "255 255 255";
	//vistexcolorend_s	= "000 100 255";
	vissizestart_s		= "5 5";
	//vissizeendscale		= 10; 
	visalphafunc_s		= "ADD";
	visalphastart		= 255;
	useemittersfor		= 0;
};

INSTANCE ITEM_GLIMMER (ITEM_GLIMMER_PROTO)
{
	visname_s			= "MFX_LIGHT_SINGLERAY.TGA";
	vistexcolorstart_s	= "50 50 50";
	vistexcolorend_s	= "255 255 255";
	vissizeendscale		= 0.001; 
};
INSTANCE WEAK_GLIMMER (ITEM_GLIMMER_PROTO)
{
	visname_s			= "MFX_LIGHT_SINGLERAY.TGA";
	vistexcolorstart_s	= "0 0 0";
	vistexcolorend_s	= "150 150 150";
	vissizeendscale		= 3; 
};
INSTANCE WEAK_GLIMMER_RED (ITEM_GLIMMER_PROTO)
{
	visname_s			= "MFX_LIGHT_SINGLERAY.TGA";
	vistexcolorstart_s	= "0 0 0";
	vistexcolorend_s	= "255 0 0";
	vissizeendscale		= 3; 
};
INSTANCE WEAK_GLIMMER_BLUE (ITEM_GLIMMER_PROTO)
{
	visname_s			= "MFX_LIGHT_SINGLERAY.TGA";
	vistexcolorstart_s	= "0 0 0";
	vistexcolorend_s	= "0 0 255";
	vissizeendscale		= 3; 
};
INSTANCE WEAK_GLIMMER_YELLOW (ITEM_GLIMMER_PROTO)
{
	visname_s			= "MFX_LIGHT_SINGLERAY.TGA";
	vistexcolorstart_s	= "0 0 0";
	vistexcolorend_s	= "150 150 0";
	vissizeendscale		= 3; 
};
INSTANCE MANA_POTION (ITEM_GLIMMER_PROTO)
{
	visname_s			= "mfx_sleep_star.TGA";
	vistexcolorstart_s	= "0 0 255";
	vistexcolorend_s	= "255 255 255";
	vissizeendscale		= 7; 
};
INSTANCE HEALTH_POTION (ITEM_GLIMMER_PROTO)
{
	visname_s			= "mfx_sleep_star.TGA";
	vistexcolorstart_s	= "255 0 0";
	vistexcolorend_s	= "255 255 255";
	vissizeendscale		= 7; 
};
INSTANCE YELLOW_POTION (ITEM_GLIMMER_PROTO)
{
	visname_s			= "mfx_sleep_star.TGA";
	vistexcolorstart_s	= "150 150 0";
	vistexcolorend_s	= "255 255 255";
	vissizeendscale		= 7; 
};
INSTANCE ITEM_STARS (ITEM_GLIMMER_PROTO)
{
	visname_s			= "mfx_sleep_star.TGA";
	vistexcolorstart_s	= "255 255 255";
	vistexcolorend_s	= "255 255 255";
	vissizeendscale		= 3; 
};
INSTANCE ITEM_STARS_RED (ITEM_GLIMMER_PROTO)
{
	visname_s			= "mfx_sleep_star.TGA";
	vistexcolorstart_s	= "255 0 0";
	vistexcolorend_s	= "255 255 255";
	vissizeendscale		= 3; 
};
INSTANCE ITEM_STARS_BLUE (ITEM_GLIMMER_PROTO)
{
	visname_s			= "mfx_sleep_star.TGA";
	vistexcolorstart_s	= "0 0 255";
	vistexcolorend_s	= "255 255 255";
	vissizeendscale		= 3; 
};
INSTANCE ITEM_STARS_YELLOW (ITEM_GLIMMER_PROTO)
{
	visname_s			= "mfx_sleep_star.TGA";
	vistexcolorstart_s	= "150 150 0";
	vistexcolorend_s	= "255 255 255";
	vissizeendscale		= 3; 
};

////////////////////////////////////////////////////////////////////////////////

INSTANCE GOLD_GLOW (C_PARTICLEFX)
{
	ppsvalue			= 20;
	ppsscalekeys_s		= "1.0";
	ppsislooping		= 1;
	ppsfps				= 1;
	shptype_s			= "MESH";
	shpfor_s			= "OBJECT";
	shpoffsetvec_s		= "0 0 0";
	shpdistribtype_s	= "RANDOM";
	shpdim_s			= "7";
//	shpmesh_s			= "HUMANS.MDS";
	shpscalekeys_s		= "1";
	shpscaleislooping	= 1;
	shpscaleissmooth	= 1;
	shpscalefps			= 2;
	dirmode_s			= "NONE";
	velavg				= 9.99999996e-012;
	lsppartavg			= 300;
	flygravity_s		= "0 0.000 0";
	visname_s			= "ELECTRICBLUE0000.TGA";
	visorientation_s	= "VELO3D";
	vistexisquadpoly	= 1;
	vistexanifps		= 15;
	vistexaniislooping	= 1;
	vistexcolorstart_s	= "255 255 255";
	vistexcolorend_s	= "255 255 0";
	vissizestart_s		= "2 2";
	vissizeendscale		= 10;
	visalphafunc_s		= "ADD";
	visalphastart		= 255;
	useemittersfor		= 0;
};

INSTANCE MAGESTAFF1(C_PARTICLEFX)
{
	ppsvalue		= 120;
	ppsscalekeys_s		= "1.0";
	ppsislooping		= 1;
	ppsfps			= 1;
	shptype_s		= "MESH";
	shpfor_s		= "OBJECT";
	shpoffsetvec_s		= "0 0 0";
	shpdistribtype_s	= "RANDOM";
	shpdim_s		= "7";
//	shpmesh_s		= "HUMANS.MDS";
	shpscalekeys_s		= "1";
	shpscaleislooping	= 1;
	shpscaleissmooth	= 1;
	shpscalefps		= 2;
	dirmode_s		= "NONE";
	velavg			= 9.99999996e-012;
	lsppartavg		= 300;
	flygravity_s		= "0 0.0000 0";
	visorientation_s	= "VELO3D";
	vistexisquadpoly	= 1;
	vistexanifps		= 15;
	vistexaniislooping	= 1;
	//vistexcolorstart_s	= "255 255 255";
	//vistexcolorend_s	= "000 100 255";
	vissizestart_s		= "8 8";
	//vissizeendscale	= 10; 
	visalphafunc_s		= "ADD";
	visalphastart		= 255;
	useemittersfor		= 0;
	visname_s		= "mfx_sleep_star.TGA";
	vistexcolorstart_s	= "0 0 255";
	vistexcolorend_s	= "255 255 255";
	vissizeendscale		= 5; 
};

INSTANCE MAGESTAFF2(C_PARTICLEFX)
{
	ppsvalue		= 100;
	ppsscalekeys_s		= "1.0";
	ppsislooping		= 1;
	ppsfps			= 1;
	shptype_s		= "MESH";
	shpfor_s		= "OBJECT";
	shpoffsetvec_s		= "0 0 0";
	shpdistribtype_s	= "RANDOM";
	shpdim_s		= "7";
//	shpmesh_s		= "HUMANS.MDS";
	shpscalekeys_s		= "1";
	shpscaleislooping	= 1;
	shpscaleissmooth	= 1;
	shpscalefps		= 2;
	dirmode_s		= "NONE";
	velavg			= 9.99999996e-012;
	lsppartavg		= 300;
	flygravity_s		= "0 0.0000 0";
	visorientation_s	= "VELO3D";
	vistexisquadpoly	= 1;
	vistexanifps		= 15;
	vistexaniislooping	= 1;
	//vistexcolorstart_s	= "255 255 255";
	//vistexcolorend_s	= "000 100 255";
	vissizestart_s		= "5 5";
	//vissizeendscale	= 10; 
	visalphafunc_s		= "ADD";
	visalphastart		= 255;
	useemittersfor		= 0;
	visname_s		= "mfx_sleep_star.TGA";
	vistexcolorstart_s	= "0 0 255";
	vistexcolorend_s	= "255 255 255";
	vissizeendscale		= 3; 
};

INSTANCE MAGESTAFF3(C_PARTICLEFX)
{
	ppsvalue		= 100;
	ppsscalekeys_s		= "1.0";
	ppsislooping		= 1;
	ppsfps			= 1;
	shptype_s		= "MESH";
	shpfor_s		= "OBJECT";
	shpoffsetvec_s		= "0 0 0";
	shpdistribtype_s	= "RANDOM";
	shpdim_s		= "7";
//	shpmesh_s		= "HUMANS.MDS";
	shpscalekeys_s		= "1";
	shpscaleislooping	= 1;
	shpscaleissmooth	= 1;
	shpscalefps		= 2;
	dirmode_s		= "NONE";
	velavg			= 9.99999996e-012;
	lsppartavg		= 300;
	flygravity_s		= "0 0.0000 0";
	visorientation_s	= "VELO3D";
	vistexisquadpoly	= 1;
	vistexanifps		= 15;
	vistexaniislooping	= 1;
	//vistexcolorstart_s	= "255 255 255";
	//vistexcolorend_s	= "000 100 255";
	vissizestart_s		= "5 5";
	//vissizeendscale	= 10; 
	visalphafunc_s		= "ADD";
	visalphastart		= 255;
	useemittersfor		= 0;
	visname_s		= "mfx_sleep_star.TGA";
	vistexcolorstart_s	= "0 0 255";
	vistexcolorend_s	= "255 255 255";
	vissizeendscale		= 3; 
};

INSTANCE MAGESTAFF4(C_PARTICLEFX)
{
	ppsvalue		= 100;
	ppsscalekeys_s		= "1.0";
	ppsislooping		= 1;
	ppsfps			= 1;
	shptype_s		= "MESH";
	shpfor_s		= "OBJECT";
	shpoffsetvec_s		= "0 0 0";
	shpdistribtype_s	= "RANDOM";
	shpdim_s		= "7";
//	shpmesh_s		= "HUMANS.MDS";
	shpscalekeys_s		= "1";
	shpscaleislooping	= 1;
	shpscaleissmooth	= 1;
	shpscalefps		= 2;
	dirmode_s		= "NONE";
	velavg			= 9.99999996e-012;
	lsppartavg		= 300;
	flygravity_s		= "0 0.0000 0";
	visorientation_s	= "VELO3D";
	vistexisquadpoly	= 1;
	vistexanifps		= 15;
	vistexaniislooping	= 1;
	//vistexcolorstart_s	= "255 255 255";
	//vistexcolorend_s	= "000 100 255";
	vissizestart_s		= "5 5";
	//vissizeendscale	= 10; 
	visalphafunc_s		= "ADD";
	visalphastart		= 255;
	useemittersfor		= 0;
	visname_s		= "mfx_sleep_star.TGA";
	vistexcolorstart_s	= "0 0 255";
	vistexcolorend_s	= "255 255 255";
	vissizeendscale		= 3; 
};

INSTANCE MAGESTAFF5(C_PARTICLEFX)
{
	ppsvalue		= 100;
	ppsscalekeys_s		= "1.0";
	ppsislooping		= 1;
	ppsfps			= 1;
	shptype_s		= "MESH";
	shpfor_s		= "OBJECT";
	shpoffsetvec_s		= "0 0 0";
	shpdistribtype_s	= "RANDOM";
	shpdim_s		= "7";
//	shpmesh_s		= "HUMANS.MDS";
	shpscalekeys_s		= "1";
	shpscaleislooping	= 1;
	shpscaleissmooth	= 1;
	shpscalefps		= 2;
	dirmode_s		= "NONE";
	velavg			= 9.99999996e-012;
	lsppartavg		= 300;
	flygravity_s		= "0 0.0000 0";
	visorientation_s	= "VELO3D";
	vistexisquadpoly	= 1;
	vistexanifps		= 15;
	vistexaniislooping	= 1;
	//vistexcolorstart_s	= "255 255 255";
	//vistexcolorend_s	= "000 100 255";
	vissizestart_s		= "5 5";
	//vissizeendscale	= 10; 
	visalphafunc_s		= "ADD";
	visalphastart		= 255;
	useemittersfor		= 0;
	visname_s		= "mfx_sleep_star.TGA";
	vistexcolorstart_s	= "0 0 255";
	vistexcolorend_s	= "255 255 255";
	vissizeendscale		= 3; 
};


INSTANCE DRAGON_EYE_LEFT (C_PARTICLEFX)
{
     ppsvalue = 50;
     ppsscalekeys_s = "1 1 1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1;
     shptype_s = "POINT";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "80 18 -10";
     shpdistribtype_s = "UNIFORM";
     shpisvolume = 1;
     shpdim_s = "4";
     shpscalekeys_s = "1";
     shpscaleissmooth = 1;
     dirmode_s = "RAND";
     dirfor_s = "WORLD";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     velavg = 9.99999975e-005;
     lsppartavg = 300;
     lsppartvar = 100;
     flygravity_s = "0 0 0";
     visname_s = "ZFLARE1.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexcolorstart_s = "180 70 20";
     vistexcolorend_s = "180 0 60";
     vissizestart_s = "5 5";
     vissizeendscale = 10;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     useemittersfor = 0;
};

INSTANCE DRAGON_EYE_RIGHT (C_PARTICLEFX)
{
     ppsvalue = 50;
     ppsscalekeys_s = "1 1 1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1;
     shptype_s = "POINT";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "80 -18 -10";
     shpdistribtype_s = "UNIFORM";
     shpisvolume = 1;
     shpdim_s = "4";
     shpscalekeys_s = "1";
     shpscaleissmooth = 1;
     dirmode_s = "RAND";
     dirfor_s = "WORLD";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     velavg = 9.99999975e-005;
     lsppartavg = 300;
     lsppartvar = 100;
     flygravity_s = "0 0 0";
     visname_s = "ZFLARE1.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexcolorstart_s = "180 70 20";
     vistexcolorend_s = "180 0 60";
     vissizestart_s = "5 5";
     vissizeendscale = 10;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     useemittersfor = 0;
};






////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
