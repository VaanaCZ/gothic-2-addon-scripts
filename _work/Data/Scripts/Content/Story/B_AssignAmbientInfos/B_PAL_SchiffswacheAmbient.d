//////////////////////////////////////////////////////////////////
///	  			 
///
///			DIA_PAL_2XX_Schiffswachen	
///
///
//////////////////////////////////////////////////////////////////

// ************************************************************
// 	  		DIA_PAL_220_Schiffswache
// ************************************************************

INSTANCE DIA_PAL_220_Schiffswache_EXIT(C_INFO)
{
	npc			= PAL_220_Schiffswache;
	nr			= 999;
	condition	= DIA_PAL_220_Schiffswache_EXIT_Condition;
	information	= DIA_PAL_220_Schiffswache_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_PAL_220_Schiffswache_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_PAL_220_Schiffswache_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info RitualDementor
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_220_Schiffswache		(C_INFO)
{
	npc		 	= 	PAL_220_Schiffswache;
	nr		 	= 	1;
	condition	= 	DIA_PAL_220_Schiffswache_Condition;
	information	= 	DIA_PAL_220_Schiffswache_Info;
	important   =	TRUE;
	permanent 	= 	TRUE;

};

func int DIA_PAL_220_Schiffswache_Condition ()
{
	B_AssignSchiffswachenInfoConditions (self);
};

func void DIA_PAL_220_Schiffswache_Info ()
{	
	B_AssignSchiffswachenTalk (self);
};


// ************************************************************
// 	  		DIA_PAL_221_Schiffswache
// ************************************************************

INSTANCE DIA_PAL_221_Schiffswache_EXIT(C_INFO)
{
	npc			= PAL_221_Schiffswache;
	nr			= 999;
	condition	= DIA_PAL_221_Schiffswache_EXIT_Condition;
	information	= DIA_PAL_221_Schiffswache_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_PAL_221_Schiffswache_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_PAL_221_Schiffswache_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info RitualDementor
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_221_Schiffswache		(C_INFO)
{
	npc		 	= 	PAL_221_Schiffswache;
	nr		 	= 	1;
	condition	= 	DIA_PAL_221_Schiffswache_Condition;
	information	= 	DIA_PAL_221_Schiffswache_Info;
	important   =	TRUE;
	permanent 	= 	TRUE;

};

func int DIA_PAL_221_Schiffswache_Condition ()
{
	B_AssignSchiffswachenInfoConditions (self);
};

func void DIA_PAL_221_Schiffswache_Info ()
{	
	B_AssignSchiffswachenTalk (self);
};

// ************************************************************
// 	  		DIA_PAL_222_Schiffswache
// ************************************************************

INSTANCE DIA_PAL_222_Schiffswache_EXIT(C_INFO)
{
	npc			= PAL_222_Schiffswache;
	nr			= 999;
	condition	= DIA_PAL_222_Schiffswache_EXIT_Condition;
	information	= DIA_PAL_222_Schiffswache_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_PAL_222_Schiffswache_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_PAL_222_Schiffswache_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info RitualDementor
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_222_Schiffswache		(C_INFO)
{
	npc		 	= 	PAL_222_Schiffswache;
	nr		 	= 	1;
	condition	= 	DIA_PAL_222_Schiffswache_Condition;
	information	= 	DIA_PAL_222_Schiffswache_Info;
	important   =	TRUE;
	permanent 	= 	TRUE;

};

func int DIA_PAL_222_Schiffswache_Condition ()
{
	B_AssignSchiffswachenInfoConditions (self);
};

func void DIA_PAL_222_Schiffswache_Info ()
{	
	B_AssignSchiffswachenTalk (self);
};

// ************************************************************
// 	  		DIA_PAL_223_Schiffswache
// ************************************************************

INSTANCE DIA_PAL_223_Schiffswache_EXIT(C_INFO)
{
	npc			= PAL_223_Schiffswache;
	nr			= 999;
	condition	= DIA_PAL_223_Schiffswache_EXIT_Condition;
	information	= DIA_PAL_223_Schiffswache_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_PAL_223_Schiffswache_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_PAL_223_Schiffswache_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info RitualDementor
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_223_Schiffswache		(C_INFO)
{
	npc		 	= 	PAL_223_Schiffswache;
	nr		 	= 	1;
	condition	= 	DIA_PAL_223_Schiffswache_Condition;
	information	= 	DIA_PAL_223_Schiffswache_Info;
	important   =	TRUE;
	permanent 	= 	TRUE;

};

func int DIA_PAL_223_Schiffswache_Condition ()
{
	B_AssignSchiffswachenInfoConditions (self);
};

func void DIA_PAL_223_Schiffswache_Info ()
{	
	B_AssignSchiffswachenTalk (self);
};

// ************************************************************
// 	  		DIA_PAL_224_Schiffswache
// ************************************************************

INSTANCE DIA_PAL_224_Schiffswache_EXIT(C_INFO)
{
	npc			= PAL_224_Schiffswache;
	nr			= 999;
	condition	= DIA_PAL_224_Schiffswache_EXIT_Condition;
	information	= DIA_PAL_224_Schiffswache_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_PAL_224_Schiffswache_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_PAL_224_Schiffswache_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info RitualDementor
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_224_Schiffswache		(C_INFO)
{
	npc		 	= 	PAL_224_Schiffswache;
	nr		 	= 	1;
	condition	= 	DIA_PAL_224_Schiffswache_Condition;
	information	= 	DIA_PAL_224_Schiffswache_Info;
	important   =	TRUE;
	permanent 	= 	TRUE;

};

func int DIA_PAL_224_Schiffswache_Condition ()
{
	B_AssignSchiffswachenInfoConditions (self);
};

func void DIA_PAL_224_Schiffswache_Info ()
{	
	B_AssignSchiffswachenTalk (self);
};

// ************************************************************
// 	  		DIA_PAL_225_Schiffswache
// ************************************************************

INSTANCE DIA_PAL_225_Schiffswache_EXIT(C_INFO)
{
	npc			= PAL_225_Schiffswache;
	nr			= 999;
	condition	= DIA_PAL_225_Schiffswache_EXIT_Condition;
	information	= DIA_PAL_225_Schiffswache_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_PAL_225_Schiffswache_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_PAL_225_Schiffswache_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info RitualDementor
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_225_Schiffswache		(C_INFO)
{
	npc		 	= 	PAL_225_Schiffswache;
	nr		 	= 	1;
	condition	= 	DIA_PAL_225_Schiffswache_Condition;
	information	= 	DIA_PAL_225_Schiffswache_Info;
	important   =	TRUE;
	permanent 	= 	TRUE;

};

func int DIA_PAL_225_Schiffswache_Condition ()
{
	B_AssignSchiffswachenInfoConditions (self);
};

func void DIA_PAL_225_Schiffswache_Info ()
{	
	B_AssignSchiffswachenTalk (self);
};

// ************************************************************
// 	  		DIA_PAL_226_Schiffswache
// ************************************************************

INSTANCE DIA_PAL_226_Schiffswache_EXIT(C_INFO)
{
	npc			= PAL_226_Schiffswache;
	nr			= 999;
	condition	= DIA_PAL_226_Schiffswache_EXIT_Condition;
	information	= DIA_PAL_226_Schiffswache_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_PAL_226_Schiffswache_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_PAL_226_Schiffswache_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info RitualDementor
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_226_Schiffswache		(C_INFO)
{
	npc		 	= 	PAL_226_Schiffswache;
	nr		 	= 	1;
	condition	= 	DIA_PAL_226_Schiffswache_Condition;
	information	= 	DIA_PAL_226_Schiffswache_Info;
	important   =	TRUE;
	permanent 	= 	TRUE;

};

func int DIA_PAL_226_Schiffswache_Condition ()
{
	B_AssignSchiffswachenInfoConditions (self);
};

func void DIA_PAL_226_Schiffswache_Info ()
{	
	B_AssignSchiffswachenTalk (self);
};

// ************************************************************
// 	  		DIA_PAL_227_Schiffswache
// ************************************************************

INSTANCE DIA_PAL_227_Schiffswache_EXIT(C_INFO)
{
	npc			= PAL_227_Schiffswache;
	nr			= 999;
	condition	= DIA_PAL_227_Schiffswache_EXIT_Condition;
	information	= DIA_PAL_227_Schiffswache_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_PAL_227_Schiffswache_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_PAL_227_Schiffswache_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info RitualDementor
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_227_Schiffswache		(C_INFO)
{
	npc		 	= 	PAL_227_Schiffswache;
	nr		 	= 	1;
	condition	= 	DIA_PAL_227_Schiffswache_Condition;
	information	= 	DIA_PAL_227_Schiffswache_Info;
	important   =	TRUE;
	permanent 	= 	TRUE;

};

func int DIA_PAL_227_Schiffswache_Condition ()
{
	B_AssignSchiffswachenInfoConditions (self);
};

func void DIA_PAL_227_Schiffswache_Info ()
{	
	B_AssignSchiffswachenTalk (self);
};

// ************************************************************
// 	  		DIA_PAL_228_Schiffswache
// ************************************************************

INSTANCE DIA_PAL_228_Schiffswache_EXIT(C_INFO)
{
	npc			= PAL_228_Schiffswache;
	nr			= 999;
	condition	= DIA_PAL_228_Schiffswache_EXIT_Condition;
	information	= DIA_PAL_228_Schiffswache_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_PAL_228_Schiffswache_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_PAL_228_Schiffswache_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info RitualDementor
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_228_Schiffswache		(C_INFO)
{
	npc		 	= 	PAL_228_Schiffswache;
	nr		 	= 	1;
	condition	= 	DIA_PAL_228_Schiffswache_Condition;
	information	= 	DIA_PAL_228_Schiffswache_Info;
	important   =	TRUE;
	permanent 	= 	TRUE;

};

func int DIA_PAL_228_Schiffswache_Condition ()
{
	B_AssignSchiffswachenInfoConditions (self);
};

func void DIA_PAL_228_Schiffswache_Info ()
{	
	B_AssignSchiffswachenTalk (self);
};
