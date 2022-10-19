
//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

var int DJG_Cipher_DragonKilledNotYet;

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_CipherDJG_EXIT   (C_INFO)
{
	npc         = DJG_703_Cipher;
	nr          = 999;
	condition   = DIA_CipherDJG_EXIT_Condition;
	information = DIA_CipherDJG_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_CipherDJG_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_CipherDJG_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Cipher_HALLO		(C_INFO)
{
	npc		 = 	DJG_703_Cipher;
	condition	 = 	DIA_Cipher_HALLO_Condition;
	information	 = 	DIA_Cipher_HALLO_Info;

	description	 = 	"£adne obozowisko.";
};

func int DIA_Cipher_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Cipher_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Cipher_HALLO_15_00"); //£adne obozowisko.
	AI_Output			(self, other, "DIA_Cipher_HALLO_07_01"); //Œwiête s³owa. Cuchnie tu jak w rzeŸni. Wszêdzie martwe zwierzêta i przegni³e drzewa.
};


///////////////////////////////////////////////////////////////////////
//	Info HelloAgain
///////////////////////////////////////////////////////////////////////
instance DIA_CipherDJG_HELLOAGAIN		(C_INFO)
{
	npc		 = 	DJG_703_Cipher;
	condition	 = 	DIA_CipherDJG_HELLOAGAIN_Condition;
	information	 = 	DIA_CipherDJG_HELLOAGAIN_Info;

	description	 = 	"Co tu porabiasz?";
};

func int DIA_CipherDJG_HELLOAGAIN_Condition ()
{
	if	(
	 	((Npc_IsDead(SwampDragon))== FALSE)
		&&(Npc_KnowsInfo(other, DIA_Cipher_HALLO))
		)
		{
				return TRUE;
		};

};

func void DIA_CipherDJG_HELLOAGAIN_Info ()
{
	AI_Output			(other, self, "DIA_CipherDJG_HELLOAGAIN_15_00"); //Co tutaj robisz?
	AI_Output			(self, other, "DIA_CipherDJG_HELLOAGAIN_07_01"); //Siedzê tu ju¿ od pewnego czasu w oczekiwaniu na odpowiedni moment.
	AI_Output			(other, self, "DIA_CipherDJG_HELLOAGAIN_15_02"); //Odpowiedni moment? Na co?
	AI_Output			(self, other, "DIA_CipherDJG_HELLOAGAIN_07_03"); //Gdzieœ tu powinien byæ smok. Od czasu jak siê pojawi³, zrobi³o siê tu wstrêtne bagno.
	AI_Output			(self, other, "DIA_CipherDJG_HELLOAGAIN_07_04"); //Dobrze pamiêtam czasy, kiedy nie trzeba by³o tutaj brodziæ...
	AI_Output			(self, other, "DIA_CipherDJG_HELLOAGAIN_07_05"); //Teraz jednak nie odwa¿y³bym siê przyjœæ tutaj sam.

	if ((Npc_IsDead(DJG_Rod)) == FALSE)
		{
			AI_Output			(self, other, "DIA_CipherDJG_HELLOAGAIN_07_06"); //Có¿. Rod wci¹¿ tu jest. A on by zwia³, gdyby zobaczy³ nawet jednego chrz¹szcza.
		};

	AI_Output			(self, other, "DIA_CipherDJG_HELLOAGAIN_07_07"); //A co z tob¹? Nie przyszed³eœ tutaj na spacer, prawda? WejdŸmy tam razem.

	B_LogEntry (TOPIC_Dragonhunter,"Cipher powiedzia³ mi, ¿e na bagnach w Górniczej Dolinie mieszka smok."); 

	Info_AddChoice	(DIA_CipherDJG_HELLOAGAIN, "Wolê byæ sam.", 	DIA_CipherDJG_HELLOAGAIN_GoAlone);
	Info_AddChoice	(DIA_CipherDJG_HELLOAGAIN, "Czemu nie - przyda mi siê pomoc.", DIA_CipherDJG_HELLOAGAIN_GoTogether);



};
func void DIA_CipherDJG_HELLOAGAIN_GoAlone ()
{
	AI_Output			(other, self, "DIA_CipherDJG_HELLOAGAIN_GoAlone_15_00"); //Wolê byæ sam.
	AI_Output			(self, other, "DIA_CipherDJG_HELLOAGAIN_GoAlone_07_01"); //Jak ci pasuje. Czyli pomyli³em siê co do ciebie!
	AI_StopProcessInfos (self);
};

func void DIA_CipherDJG_HELLOAGAIN_GoTogether ()
{
	AI_Output			(other, self, "DIA_CipherDJG_HELLOAGAIN_GoTogether_15_00"); //Czemu nie - przyda mi siê pomoc.
	AI_Output			(self, other, "DIA_CipherDJG_HELLOAGAIN_GoTogether_07_01"); //To dobrze. Czyli w koñcu siê st¹d wydostanê. Ten smród jest nie do zniesienia. Daj mi tylko znaæ kiedy!

	DJG_SwampParty = TRUE;
	Info_ClearChoices	(DIA_CipherDJG_HELLOAGAIN);
};

///////////////////////////////////////////////////////////////////////
//	Info GoTogetherAgain
///////////////////////////////////////////////////////////////////////
instance DIA_CipherDJG_GOTOGETHERAGAIN		(C_INFO)
{
	npc		 = 	DJG_703_Cipher;
	condition	 = 	DIA_CipherDJG_GOTOGETHERAGAIN_Condition;
	information	 = 	DIA_CipherDJG_GOTOGETHERAGAIN_Info;



	description	 = 	"Zmieni³em zdanie! ChodŸmy razem!";
};

func int DIA_CipherDJG_GOTOGETHERAGAIN_Condition ()
{
	if
	( 
	(Npc_KnowsInfo(other, DIA_CipherDJG_HELLOAGAIN)) 
	&& (DJG_SwampParty == FALSE) 
	&& ((Npc_IsDead(Swampdragon)) == FALSE)
	)
		{
		return TRUE;
		};
};

func void DIA_CipherDJG_GOTOGETHERAGAIN_Info ()
{
	AI_Output			(other, self, "DIA_CipherDJG_GOTOGETHERAGAIN_15_00"); //Zmieni³em zdanie! ChodŸmy razem!
	AI_Output			(self, other, "DIA_CipherDJG_GOTOGETHERAGAIN_07_01"); //Daj mi tylko znaæ kiedy!
	DJG_SwampParty = TRUE;
};



///////////////////////////////////////////////////////////////////////
//	Info Go
///////////////////////////////////////////////////////////////////////
instance DIA_CipherDJG_GO		(C_INFO)
{
	npc		 = 	DJG_703_Cipher;
	condition	 = 	DIA_CipherDJG_GO_Condition;
	information	 = 	DIA_CipherDJG_GO_Info;



	description	 = 	"Teraz jest dobry moment, ¿eby ruszyæ!";
};

func int DIA_CipherDJG_GO_Condition ()
{	
	if 
	(
	(DJG_SwampParty == TRUE)
	&& ((Npc_IsDead(SwampDragon))== FALSE)
	)
	
	{
	return TRUE;
	};
};
var int DJG_SwampParty_GoGoGo;
func void DIA_CipherDJG_GO_Info ()
{
	AI_Output			(other, self, "DIA_CipherDJG_GO_15_00"); //Teraz jest dobry moment, ¿eby ruszyæ!
	AI_Output			(self, other, "DIA_CipherDJG_GO_07_01"); //ChodŸmy wiêc!

	AI_StopProcessInfos	(self);	
	DJG_SwampParty_GoGoGo = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	DJG_Rod.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,	"SwampWait1");
	B_StartOtherRoutine  (DJG_Rod,"SwampWait1");
};


//***************************************************************************
//	Info SwampWait2
//***************************************************************************
INSTANCE DIA_CipherDJG_SwampWait2 (C_INFO)
{
	npc			= DJG_703_Cipher;
	condition	= DIA_CipherDJG_SwampWait2_Condition;
	information	= DIA_CipherDJG_SwampWait2_Info;
	important	= TRUE;	

};                       

FUNC INT DIA_CipherDJG_SwampWait2_Condition()
{	
	if (
		(Npc_GetDistToWP(self,"OW_DJG_SWAMP_WAIT1_01")<700)
		&& ((Npc_IsDead(SwampDragon))== FALSE)
		)
	 				
	{
		return TRUE;
	};
};

func VOID DIA_CipherDJG_SwampWait2_Info()
{
	AI_Output (self, other,"DIA_CipherDJG_SwampWait2_07_00"); //Bagno zaczyna siê za nastêpnym zakrêtem. Powinniœmy pójœæ prosto.
	AI_Output (self, other,"DIA_CipherDJG_SwampWait2_07_01"); //Albo mo¿esz wypróbowaæ tamten korytarz, tak ¿eby ¿adna z bestii nie zaatakowa³a nas z ty³u. Co wolisz?
	AI_Output (other, self,"DIA_CipherDJG_SwampWait2_15_02"); //Nie marnujmy czasu!

	Info_AddChoice	(DIA_CipherDJG_SwampWait2, DIALOG_ENDE, DIA_CipherDJG_SwampWait2_weiter );
};

func void DIA_CipherDJG_SwampWait2_weiter ()
{

	AI_StopProcessInfos	(self);
	
	DJG_SwampParty = TRUE; 
	DJG_SwampParty_GoGoGo = TRUE; 
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	DJG_Rod.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,	"SwampWait2");
	B_StartOtherRoutine  (DJG_Rod,"SwampWait2");

};


//***************************************************************************
//	Info GoForSwampDragon
//***************************************************************************
INSTANCE DIA_CipherDJG_GoForSwampDragon (C_INFO)
{
	npc			= DJG_703_Cipher;
	condition	= DIA_CipherDJG_GoForSwampDragon_Condition;
	information	= DIA_CipherDJG_GoForSwampDragon_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT DIA_CipherDJG_GoForSwampDragon_Condition()
{
	if (
		(Npc_GetDistToWP(self,"OW_DJG_SWAMP_WAIT2_01")<1000) 
		&& ((Npc_IsDead(SwampDragon))== FALSE)
		)
	{
		return TRUE;
	};
};

func VOID DIA_CipherDJG_GoForSwampDragon_Info()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Swamp_Exit)) //Joly: schon zum Drachen gesprochen!
	{
	AI_Output			(self, other, "DIA_CipherDJG_GoForSwampDragon_07_00"); //Do ataku!
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,"SwampDragon");
	B_StartOtherRoutine	(DJG_Rod,"SwampDragon");
	}
	else	//Joly: noch nicht zum Drachen gesprochen! griefen an, wenn der Dialog mit "Swampi" zu ende ist
	{
	AI_Output			(self, other, "DIA_CipherDJG_GoForSwampDragon_07_01"); //Ju¿ s³yszê stwora. Musimy uwa¿aæ!
	AI_Output			(self, other, "DIA_CipherDJG_GoForSwampDragon_07_02"); //No dalej, zobaczmy, czy mo¿emy zaatakowaæ.
	AI_StopProcessInfos	(self);
	};
	self.flags =0;	//Joly: Wer weiß!!?!
	DJG_Rod.flags =0; 
};

///////////////////////////////////////////////////////////////////////
//	Info SwampDragonDead
///////////////////////////////////////////////////////////////////////
instance DIA_CipherDJG_SWAMPDRAGONDEAD		(C_INFO)
{
	npc		 	 = 	DJG_703_Cipher;
	condition	 = 	DIA_CipherDJG_SWAMPDRAGONDEAD_Condition;
	information	 = 	DIA_CipherDJG_SWAMPDRAGONDEAD_Info;
	important	 = 	TRUE;
};

func int DIA_CipherDJG_SWAMPDRAGONDEAD_Condition ()
{
	if 	(
		((Npc_IsDead(SwampDragon))== TRUE)	
		&& (DJG_SwampParty == TRUE)
		&& (DJG_SwampParty_GoGoGo == TRUE)
		)
	{
		return TRUE;
	};
};

func void DIA_CipherDJG_SWAMPDRAGONDEAD_Info ()
{
	AI_Output			(self, other, "DIA_CipherDJG_SWAMPDRAGONDEAD_07_00"); //Cholera, nie ¿yje?
	AI_Output			(other, self, "DIA_CipherDJG_SWAMPDRAGONDEAD_15_01"); //Uspokój siê. To ju¿ koniec!
	AI_Output			(self, other, "DIA_CipherDJG_SWAMPDRAGONDEAD_07_02"); //O rany, ale w dechê koleœ!
	
	AI_StopProcessInfos	(self);
	B_GivePlayerXP (XP_CipherDJGDeadDragon);

	DJG_SwampParty = FALSE;
	DJG_SwampParty_GoGoGo = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	DJG_Rod.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,	"Start");
	B_StartOtherRoutine	(DJG_Rod,"Start");
};

///////////////////////////////////////////////////////////////////////
//	Info WhatNext
///////////////////////////////////////////////////////////////////////
instance DIA_CipherDJG_WHATNEXT		(C_INFO)
{
	npc		     = 	DJG_703_Cipher;
	condition	 = 	DIA_CipherDJG_WHATNEXT_Condition;
	information	 = 	DIA_CipherDJG_WHATNEXT_Info;
	permanent	 = 	TRUE;

	description	 = 	"Bagienny smok nie ¿yje!";
};

func int DIA_CipherDJG_WHATNEXT_Condition ()
{
	if ((Npc_IsDead(SwampDragon))== TRUE)	
	{
		return TRUE;
	};
};

func void DIA_CipherDJG_WHATNEXT_Info ()
{
	AI_Output	(other, self, "DIA_CipherDJG_WHATNEXT_15_00"); //Bagienny smok nie ¿yje! Co teraz zrobisz?
	AI_Output	(self, other, "DIA_CipherDJG_WHATNEXT_07_01"); //Nie mam pojêcia. Nie zastanawia³em siê nad tym, naprawdê. W ka¿dym razie mo¿esz wróciæ do Khorinis jako bohater.
	AI_Output	(self, other, "DIA_CipherDJG_WHATNEXT_07_02"); //Za³o¿ê siê, ¿e mo¿na na tym zarobiæ. Zastanów siê.

	B_LogEntry (TOPIC_Dragonhunter,"Kiedy bagienny smok zosta³ zabity, Cipher stwierdzi³, ¿e zbije fortunê jako 'bohater'. To siê jeszcze oka¿e."); 

	AI_StopProcessInfos	(self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Cipher_PICKPOCKET (C_INFO)
{
	npc			= DJG_703_Cipher;
	nr			= 900;
	condition	= DIA_Cipher_PICKPOCKET_Condition;
	information	= DIA_Cipher_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Cipher_PICKPOCKET_Condition()
{
	C_Beklauen (79, 220);
};
 
FUNC VOID DIA_Cipher_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Cipher_PICKPOCKET);
	Info_AddChoice		(DIA_Cipher_PICKPOCKET, DIALOG_BACK 		,DIA_Cipher_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Cipher_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Cipher_PICKPOCKET_DoIt);
};

func void DIA_Cipher_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Cipher_PICKPOCKET);
};
	
func void DIA_Cipher_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Cipher_PICKPOCKET);
};



	





























