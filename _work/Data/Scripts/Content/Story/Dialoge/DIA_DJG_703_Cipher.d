
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

	description	 = 	"P�kn� t�bor.";
};

func int DIA_Cipher_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Cipher_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Cipher_HALLO_15_00"); //P�kn� t�bor.
	AI_Output			(self, other, "DIA_Cipher_HALLO_07_01"); //To ��k� ty. V�ude jsou jen sam� zv��ec� mrtvoly a pora�en� kmeny.
};


///////////////////////////////////////////////////////////////////////
//	Info HelloAgain
///////////////////////////////////////////////////////////////////////
instance DIA_CipherDJG_HELLOAGAIN		(C_INFO)
{
	npc		 = 	DJG_703_Cipher;
	condition	 = 	DIA_CipherDJG_HELLOAGAIN_Condition;
	information	 = 	DIA_CipherDJG_HELLOAGAIN_Info;

	description	 = 	"Co tady d�l�?";
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
	AI_Output			(other, self, "DIA_CipherDJG_HELLOAGAIN_15_00"); //Co tady d�l�?
	AI_Output			(self, other, "DIA_CipherDJG_HELLOAGAIN_07_01"); //N�jakou dobu tu jen posed�v�m a �ek�m na vhodn� okam�ik.
	AI_Output			(other, self, "DIA_CipherDJG_HELLOAGAIN_15_02"); //Vhodn� okam�ik? Na co?
	AI_Output			(self, other, "DIA_CipherDJG_HELLOAGAIN_07_03"); //Tamhle naho�e by m�l hn�zdit drak. Od t� doby, co p�i�el, tam vzniknul p�kn� smradlavej mo��l.
	AI_Output			(self, other, "DIA_CipherDJG_HELLOAGAIN_07_04"); //Moc dob�e se pamatuju doby, kdy tady kolem bylo �pln� sucho.
	AI_Output			(self, other, "DIA_CipherDJG_HELLOAGAIN_07_05"); //Ale te� u� tam nikdy nep�jdu s�m.

	if ((Npc_IsDead(DJG_Rod)) == FALSE)
		{
			AI_Output			(self, other, "DIA_CipherDJG_HELLOAGAIN_07_06"); //Fajn. Rod je je�t� po��d tady. Ale vezme nohy na ramena hned, jak uvid� prvn� �ravou �t�nici.
		};

	AI_Output			(self, other, "DIA_CipherDJG_HELLOAGAIN_07_07"); //A co ty? Ty jsi sem taky nep�i�el jen tak pro z�bavu, co? Tak tam p�jdem spolu.

	B_LogEntry (TOPIC_Dragonhunter,"Podle Ciphera se pr� v ba�in�ch v Hornick�m �dol� usadil drak."); 

	Info_AddChoice	(DIA_CipherDJG_HELLOAGAIN, "Rad�i z�stanu s�m.", 	DIA_CipherDJG_HELLOAGAIN_GoAlone);
	Info_AddChoice	(DIA_CipherDJG_HELLOAGAIN, "Pro� ne - m��u pot�ebovat n�jakou pomoc.", DIA_CipherDJG_HELLOAGAIN_GoTogether);



};
func void DIA_CipherDJG_HELLOAGAIN_GoAlone ()
{
	AI_Output			(other, self, "DIA_CipherDJG_HELLOAGAIN_GoAlone_15_00"); //Rad�ji z�st�v�m s�m.
	AI_Output			(self, other, "DIA_CipherDJG_HELLOAGAIN_GoAlone_07_01"); //Jak je libo. Asi jsem se v tob� dost spletl.
	AI_StopProcessInfos (self);
};

func void DIA_CipherDJG_HELLOAGAIN_GoTogether ()
{
	AI_Output			(other, self, "DIA_CipherDJG_HELLOAGAIN_GoTogether_15_00"); //Pro� ne - m��u pot�ebovat n�jakou pomoc.
	AI_Output			(self, other, "DIA_CipherDJG_HELLOAGAIN_GoTogether_07_01"); //Tak fajn. Kone�n� odsud m��u vypadnout. Ten z�pach je k nevydr�en�. Sta�� ��ct!

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



	description	 = 	"Rozmyslel jsem si to! Jdeme tam spolu!";
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
	AI_Output			(other, self, "DIA_CipherDJG_GOTOGETHERAGAIN_15_00"); //Rozmyslel jsem si to! Jdeme tam spolu!
	AI_Output			(self, other, "DIA_CipherDJG_GOTOGETHERAGAIN_07_01"); //Sta�� ��ct!
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



	description	 = 	"Te� by mohla b�t ta spr�vn� chv�le, abysme vyrazili!";
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
	AI_Output			(other, self, "DIA_CipherDJG_GO_15_00"); //Te� by mohla b�t ta spr�vn� chv�le, abysme vyrazili!
	AI_Output			(self, other, "DIA_CipherDJG_GO_07_01"); //Tak jdeme!

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
	AI_Output (self, other,"DIA_CipherDJG_SwampWait2_07_00"); //Ta ba�ina za��n� hned za prvn� zat��kou. Asi bychom m�li j�t p��mo tudy.
	AI_Output (self, other,"DIA_CipherDJG_SwampWait2_07_01"); //Nebo taky m��e� zkusit ten pr�chod tamhle. Tam se n�m ��dn� bestie do zad nedostane. Tak jak?
	AI_Output (other, self,"DIA_CipherDJG_SwampWait2_15_02"); //Tak u� neztr�cejme ani chvilku!

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
	AI_Output			(self, other, "DIA_CipherDJG_GoForSwampDragon_07_00"); //(k�i��) �tok!
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,"SwampDragon");
	B_StartOtherRoutine	(DJG_Rod,"SwampDragon");
	}
	else	//Joly: noch nicht zum Drachen gesprochen! griefen an, wenn der Dialog mit "Swampi" zu ende ist
	{
	AI_Output			(self, other, "DIA_CipherDJG_GoForSwampDragon_07_01"); //U� jsem ty nestv�ry zaslechl. Mus�me b�t opatrn�!
	AI_Output			(self, other, "DIA_CipherDJG_GoForSwampDragon_07_02"); //Pokra�uj a sleduj, jestli se d� za�to�it.
	AI_StopProcessInfos	(self);
	};
	self.flags =0;	//Joly: Wer wei�!!?!
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
	AI_Output			(self, other, "DIA_CipherDJG_SWAMPDRAGONDEAD_07_00"); //Sakra. Je to mrtv�?
	AI_Output			(other, self, "DIA_CipherDJG_SWAMPDRAGONDEAD_15_01"); //Uklidni se. U� je po v�em!
	AI_Output			(self, other, "DIA_CipherDJG_SWAMPDRAGONDEAD_07_02"); //Chlape, ty se� ale eso.
	
	AI_StopProcessInfos	(self);
	B_GivePlayerXP (XP_CipherDJGDeadDragon);

	DJG_SwampParty = FALSE;
	DJG_SwampParty_GoGoGo = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	DJG_Rod.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,	"Za��t");
	B_StartOtherRoutine	(DJG_Rod,"Za��t");
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

	description	 = 	"Mo��lov� drak je mrtv�! Co te� bude� d�lat?";
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
	AI_Output	(other, self, "DIA_CipherDJG_WHATNEXT_15_00"); //Mo��lov� drak je po smrti! Co bude� d�lat te�?
	AI_Output	(self, other, "DIA_CipherDJG_WHATNEXT_07_01"); //Nem�m tu�en�. Je�t� jsem o tom nep�em��lel, v�n�. Ale v ka�dym p��pad� se te� m��e� vr�tit do Khorinidu jako hrdina.
	AI_Output	(self, other, "DIA_CipherDJG_WHATNEXT_07_02"); //Vsad�m se, �e z toho jde docela dost vyt�it. P�em��lej o tom.

	B_LogEntry (TOPIC_Dragonhunter,"Kdy� je mo��lov� drak mrtv�, chce z toho Cipher vyt��skat n�jak� prachy a st�t se velk�m 'hrdinou'. No, uvid�me."); 

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



	





























