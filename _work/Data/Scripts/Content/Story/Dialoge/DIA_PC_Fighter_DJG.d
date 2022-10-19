
// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_GornDJG_EXIT(C_INFO)
{
	npc		= PC_Fighter_DJG;
	nr		= 999;
	condition	= DIA_GornDJG_EXIT_Condition;
	information	= DIA_GornDJG_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_GornDJG_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_GornDJG_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_STARTCAMP		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_STARTCAMP_Condition;
	information	 = 	DIA_GornDJG_STARTCAMP_Info;

	description	 = 	"Vid�m, �e ses p�idal k drakobijc�m.";
};

func int DIA_GornDJG_STARTCAMP_Condition ()
{
	if (Npc_GetDistToWP(self,"OW_DJG_STARTCAMP_01")<1000) 				
		{
			return TRUE;
		};
};

func void DIA_GornDJG_STARTCAMP_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_STARTCAMP_15_00"); //Vid�m, �e ses p�idal k drakobijc�m.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_12_01"); //�el jsem se Sylviem do Hornick�ho �dol�, proto�e se tady vyzn�m ze v�ech nejl�pe a cht�l jsem si ud�lat p�esnou p�edstavu o zdej�� situaci.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_12_02"); //Jedno ti pov�m. N�co se tu chyst�. Je�t� nikdy jsem nevid�l tolik sk�et� na jednom m�st�.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_12_03"); //Nedivil bych se, kdyby touhle dobou Garond a v�ichni paladini z hradu u� neutekli nebo nebyli rozsekan� na kousky.

	Info_AddChoice	(DIA_GornDJG_STARTCAMP, "Uvid�me se.", DIA_GornDJG_STARTCAMP_By );
	Info_AddChoice	(DIA_GornDJG_STARTCAMP, "Co bude� d�lat te�?", DIA_GornDJG_STARTCAMP_Wohin );


};
func void DIA_GornDJG_STARTCAMP_Wohin ()
{
	AI_Output			(other, self, "DIA_GornDJG_STARTCAMP_Wohin_15_00"); //Co chce� d�lat?
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_Wohin_12_01"); //Nejd��v p�jdu tady s chlapci do Hornick�ho �dol� a pak vyraz�m.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_Wohin_12_02"); //Rozhodn� mus�m zjistit, co maj� sk�eti za lubem.

};

func void DIA_GornDJG_STARTCAMP_By ()
{
	AI_Output			(other, self, "DIA_GornDJG_STARTCAMP_By_15_00"); //Uvid�me se.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_By_12_01"); //D�vej na sebe pozor.
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_HALLO		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_HALLO_Condition;
	information	 = 	DIA_GornDJG_HALLO_Info;

	description	 = 	"Tak tady ses za�il!";
};

func int DIA_GornDJG_HALLO_Condition ()
{
	if (Npc_GetDistToWP(self,"OW_DJG_ROCKCAMP_01")<1500) 				
		{
			return TRUE;
		};
};

func void DIA_GornDJG_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_HALLO_15_00"); //Tak�e tady ses za�il!
	AI_Output			(self, other, "DIA_GornDJG_HALLO_12_01"); //Nen� tak snadn� se zab�t, co?

};

///////////////////////////////////////////////////////////////////////
//	Info WhatsUp
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_WHATSUP		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_WHATSUP_Condition;
	information	 = 	DIA_GornDJG_WHATSUP_Info;

	description	 = 	"U� jsi n�co chytil?";
};

func int DIA_GornDJG_WHATSUP_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_GornDJG_HALLO))
		{
				return TRUE;
		};
};

func void DIA_GornDJG_WHATSUP_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_WHATSUP_15_00"); //U� jsi n�co chytil?
	AI_Output			(self, other, "DIA_GornDJG_WHATSUP_12_01"); //Po��d �ek�m. �ekl bych, �e tam v t�ch skaln�ch trosk�ch n�co je. V noci se tam sv�t� a jsou dokonce sly�et n�jak� sk�eky.

	Info_ClearChoices	(DIA_GornDJG_WHATSUP);
	Info_AddChoice		(DIA_GornDJG_WHATSUP, "�e by Lester?", DIA_GornDJG_WHATSUP_Lester );
	Info_AddChoice		(DIA_GornDJG_WHATSUP, "Drak?", DIA_GornDJG_WHATSUP_A_Dragon );
	
	B_LogEntry (TOPIC_Dragonhunter,"Gorn hl�dkuje na �pat� plo�iny u star� kamenn� pevnosti. Tak m��e dob�e pozorovat nejen ji, ale i sk�et� opevn�n�."); 
};
func void DIA_GornDJG_WHATSUP_Lester ()
{
	AI_Output			(other, self, "DIA_GornDJG_WHATSUP_Lester_15_00"); //Mo�n� to je Lester, kter� se vr�til do sv�ch rozvalin?
	AI_Output			(self, other, "DIA_GornDJG_WHATSUP_Lester_12_01"); //To t�ko. Co v�m, Lester tu u� ne�ije.
};

func void DIA_GornDJG_WHATSUP_A_Dragon ()
{
	AI_Output			(other, self, "DIA_GornDJG_WHATSUP_A_Dragon_15_00"); //Drak?
	AI_Output			(self, other, "DIA_GornDJG_WHATSUP_A_Dragon_12_01"); //Dost mo�n�. Ta planina je st�e�en� jako n�jak� mizern� kr�lovsk� pokladnice. Ale je to bohu�el jedin� cesta k pevnosti.
	AI_Output			(self, other, "DIA_GornDJG_WHATSUP_A_Dragon_12_02"); //Jako by nesta�ilo, �e jsou draci dost nep��jemn� sami o sob�. Vypad� to, �e maj� v z�loze je�t� p�r dal��ch p��er.

	GornDJG_WhatMonsters = TRUE;

	B_LogEntry (TOPIC_Dragonhunter,"Podle Gorna se ve star� kamenn� pevnosti usadil drak."); 
	
	Info_ClearChoices	(DIA_GornDJG_WHATSUP);
};

///////////////////////////////////////////////////////////////////////
//	Info WhatMonsters
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_WHATMONSTERS		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_WHATMONSTERS_Condition;
	information	 = 	DIA_GornDJG_WHATMONSTERS_Info;

	description	 = 	"Jak� p��ery to jsou?";
};

func int DIA_GornDJG_WHATMONSTERS_Condition ()
{
	if (GornDJG_WhatMonsters == TRUE)
		{
				return TRUE;
		};
};

func void DIA_GornDJG_WHATMONSTERS_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_WHATMONSTERS_15_00"); //Jak� p��ery to jsou?
	AI_Output			(self, other, "DIA_GornDJG_WHATMONSTERS_12_01"); //Nev�m to �pln� p�esn�, ale chod� vzp��men� a maj� �upinatou k��i. Pohybuj� se po skal�ch jako ch�apavci, kte�� vyc�tili ob��.
	AI_Output			(self, other, "DIA_GornDJG_WHATMONSTERS_12_02"); //Tady dole je sly��m fun�t a sup�t. �ekl bych, �e zabrali �pln� celou planinu.

};


///////////////////////////////////////////////////////////////////////
//	Info WahtAboutOrcs
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_WAHTABOUTORCS		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_WAHTABOUTORCS_Condition;
	information	 = 	DIA_GornDJG_WAHTABOUTORCS_Info;

	description	 = 	"A co sk�eti?";
};

func int DIA_GornDJG_WAHTABOUTORCS_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_GornDJG_HALLO))
		{
				return TRUE;
		};
};

func void DIA_GornDJG_WAHTABOUTORCS_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_WAHTABOUTORCS_15_00"); //A co sk�eti?
	AI_Output			(self, other, "DIA_GornDJG_WAHTABOUTORCS_12_01"); //Chv�li jsem je sledoval. Za tou ohradou dole se mus� n�co ukr�vat. M�m podez�en�, �e se jich tam shrom�dil u� p�kn� z�stup.
	AI_Output			(other, self, "DIA_GornDJG_WAHTABOUTORCS_15_02"); //T�m chce� ��ct, �e jich tam je V�C ne� tady?
	AI_Output			(self, other, "DIA_GornDJG_WAHTABOUTORCS_12_03"); //Nep�ekvapilo by m�, kdyby jednoho dne tu palis�du strhli a zaplavili celou zemi. V�bec se mi to nechce l�bit.
	AI_Output			(self, other, "DIA_GornDJG_WAHTABOUTORCS_12_04"); //Pokud se to stane, budu se muset vr�tit a varovat Leeho. Stejn� se chce z ostrova zdekovat. Pak bude nejvy��� �as.

};

///////////////////////////////////////////////////////////////////////
//	Info HelpKillDraconians
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_HELPKILLDRACONIANS		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_HELPKILLDRACONIANS_Condition;
	information	 = 	DIA_GornDJG_HELPKILLDRACONIANS_Info;

	description	 = 	"M��e� mi pomoci dostat se do pevnosti?";
};

func int DIA_GornDJG_HELPKILLDRACONIANS_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_GornDJG_WHATMONSTERS))
		&& (Npc_KnowsInfo(other, DIA_GornDJG_WAHTABOUTORCS))
		&& ((Npc_IsDead(RockDragon))== FALSE)
		)
			{
					return TRUE;
			};
};

func void DIA_GornDJG_HELPKILLDRACONIANS_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_HELPKILLDRACONIANS_15_00"); //M��e� mi pomoci dostat se do pevnosti?
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_01"); //To v�n� nev�m. Boj�m se, �e sk�eti za�to�� p�esn� ve chv�li, kdy je pust�m z o��.
	AI_Output			(other, self, "DIA_GornDJG_HELPKILLDRACONIANS_15_02"); //To je paranoidn�!
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_03"); //Nem��u si pomoct. V�, nikdy bych si neodpustil, kdybych p�i�el pozd�. Na druhou stranu...
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_04"); //V�dy� je to jedno! Pro� jinak bych tady byl? Za�to�me na planinu a prosekejme si cestu do pevnosti.
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_05"); //Tro�ka pohybu n�m neu�kod�. Krom� toho bych se docela r�d pod�val na ty bestie v�c zbl�zka.
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_06"); //Dej mi v�d�t, a� bude� p�ipraven!

	B_LogEntry (TOPIC_Dragonhunter,"Gorn mi chce pomoci proniknout do kamenn� pevnosti na planin�."); 

};

///////////////////////////////////////////////////////////////////////
//	Info LosGeht�s
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_LOSGEHTS		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_LOSGEHTS_Condition;
	information	 = 	DIA_GornDJG_LOSGEHTS_Info;

	description	 = 	"Za�to�me!";
};

func int DIA_GornDJG_LOSGEHTS_Condition ()
{
if (Npc_KnowsInfo(other, DIA_GornDJG_HELPKILLDRACONIANS))
		{
				return TRUE;
		};
};

func void DIA_GornDJG_LOSGEHTS_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_LOSGEHTS_15_00"); //Za�to�me!
	AI_Output			(self, other, "DIA_GornDJG_LOSGEHTS_12_01"); //Jako za star�ch �as�, co? Ale jedno ti �eknu: tohle je moje bitva. Tentokr�t jdu vep�edu j�!

	AI_StopProcessInfos (self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,"RunToRockRuinBridge"); 
};




///////////////////////////////////////////////////////////////////////
//	Info BisHierhin
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_BISHIERHIN		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_BISHIERHIN_Condition;
	information	 = 	DIA_GornDJG_BISHIERHIN_Info;
	important	 = 	TRUE;
};

func int DIA_GornDJG_BISHIERHIN_Condition ()
{
	if (Npc_GetDistToWP(self,"LOCATION_19_01")<1000) 				
		{
			return TRUE;
		};
};

func void DIA_GornDJG_BISHIERHIN_Info ()
{
	AI_Output			(self, other, "DIA_GornDJG_BISHIERHIN_12_00"); //Byla to hra�ka. Tak, p��teli, o zbytek se u� bude� muset postarat ty. Po��dn� jim zatop! J� se vr�t�m a budu zase d�vat pozor na sk�ety.
	AI_Output			(other, self, "DIA_GornDJG_BISHIERHIN_15_01"); //��dn� probl�m. Je�t� se uvid�me!
	AI_Output			(self, other, "DIA_GornDJG_BISHIERHIN_12_02"); //To douf�m!

	B_LogEntry (TOPIC_Dragonhunter,"Gorn se vr�til zp�t na sv� pozorovac� stanovi�t�. Chce i nad�le sledovat sk�ety."); 

	B_GivePlayerXP (XP_GornDJGPlateauClear);
 	
 	AI_StopProcessInfos (self);
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"Za��t");
};

///////////////////////////////////////////////////////////////////////
//	Info DragonDead
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_DRAGONDEAD		(C_INFO)
{
	npc		 	 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_DRAGONDEAD_Condition;
	information	 = 	DIA_GornDJG_DRAGONDEAD_Info;

	description	 = 	"Drak ze skal je mrtv�!";	
};

func int DIA_GornDJG_DRAGONDEAD_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_GornDJG_WHATSUP))
		&& (Npc_GetDistToWP(self,"OW_DJG_ROCKCAMP_01")<1000)
		&&  ((Npc_IsDead(RockDragon))== TRUE)
		)
		{
				return TRUE;
		};
};

func void DIA_GornDJG_DRAGONDEAD_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_DRAGONDEAD_15_00"); //Drak ze skal je mrtv�!
	AI_Output			(self, other, "DIA_GornDJG_DRAGONDEAD_12_01"); //Nesly��m ��dn� dal�� sk�eky! Byl jsi v t� skaln� pevnosti?
	AI_Output			(other, self, "DIA_GornDJG_DRAGONDEAD_15_02"); //Ano!
	AI_Output			(self, other, "DIA_GornDJG_DRAGONDEAD_12_03"); //Ha, ha! To jsem si domyslel. Kdekoliv se objev�, nez�stane k�men na kameni.
	AI_Output			(other, self, "DIA_GornDJG_DRAGONDEAD_15_04"); //Co bude� d�lat d�l?
	AI_Output			(self, other, "DIA_GornDJG_DRAGONDEAD_12_05"); //Je�t� chv�li tu z�stanu a pak se vr�t�m k Leeovi. Mo�n� se tam zase setk�me!
	AI_Output			(self, other, "DIA_GornDJG_DRAGONDEAD_12_06"); //Cel� tahle krajina mi za��n� l�zt na nervy. U� je na�ase, abychom odsud vypadli.
	AI_Output			(other, self, "DIA_GornDJG_DRAGONDEAD_15_07"); //Uvid�me se pozd�ji!
	B_GivePlayerXP (XP_Ambient);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Fighter_DJG_PICKPOCKET (C_INFO)
{
	npc			= PC_Fighter_DJG;
	nr			= 900;
	condition	= DIA_Fighter_DJG_PICKPOCKET_Condition;
	information	= DIA_Fighter_DJG_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Fighter_DJG_PICKPOCKET_Condition()
{
	C_Beklauen (10, 35);
};
 
FUNC VOID DIA_Fighter_DJG_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Fighter_DJG_PICKPOCKET);
	Info_AddChoice		(DIA_Fighter_DJG_PICKPOCKET, DIALOG_BACK 		,DIA_Fighter_DJG_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Fighter_DJG_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Fighter_DJG_PICKPOCKET_DoIt);
};

func void DIA_Fighter_DJG_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Fighter_DJG_PICKPOCKET);
};
	
func void DIA_Fighter_DJG_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Fighter_DJG_PICKPOCKET);
};











