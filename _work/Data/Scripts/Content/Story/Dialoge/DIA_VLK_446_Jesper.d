//////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_EXIT   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 999;
	condition   = DIA_Jesper_EXIT_Condition;
	information = DIA_Jesper_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Jesper_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Jesper_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Jesper_PICKPOCKET (C_INFO)
{
	npc			= VLK_446_Jesper;
	nr			= 900;
	condition	= DIA_Jesper_PICKPOCKET_Condition;
	information	= DIA_Jesper_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Jesper_PICKPOCKET_Condition()
{
	C_Beklauen (80, 180);
};
 
FUNC VOID DIA_Jesper_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Jesper_PICKPOCKET);
	Info_AddChoice		(DIA_Jesper_PICKPOCKET, DIALOG_BACK 		,DIA_Jesper_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Jesper_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Jesper_PICKPOCKET_DoIt);
};

func void DIA_Jesper_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Jesper_PICKPOCKET);
};
	
func void DIA_Jesper_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Jesper_PICKPOCKET);
};
//////////////////////////////////////////////////////////////////////
//	Info Hallo 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_Hallo   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 1;
	condition   = DIA_Jesper_Hallo_Condition;
	information = DIA_Jesper_Hallo_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Jesper_Hallo_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Jesper_Hallo_Info()
{
	AI_Output (self, other,"DIA_Jesper_Hallo_09_00");//Hej, co tam dole d�l�? Tady nen� nic pro tebe.
	AI_Output (self, other,"DIA_Jesper_Hallo_09_01");//Tak ven s t�m, co tady d�l�?
		
	Info_ClearChoices (DIA_Jesper_Hallo);
	Info_AddChoice 	  (DIA_Jesper_Hallo,"P�i�el jsem t� zab�t.",DIA_Jesper_Hallo_Kill);	
	Info_AddChoice 	  (DIA_Jesper_Hallo,"Jen jsem se tu cht�l trochu rozhl�dnout.",DIA_Jesper_Hallo_NurSo);
		
	if  (Attila_Key == TRUE)
	{
		Info_AddChoice 	  (DIA_Jesper_Hallo,"Attila mi dal kl��...",DIA_Jesper_Hallo_Willkommen);
	}	
	else 
	{
		Info_AddChoice 	  (DIA_Jesper_Hallo,"Attilu u� jsem odd�lal...",DIA_Jesper_Hallo_Umgelegt);
	};
	
	DG_gefunden = TRUE;
	
};
FUNC VOID DIA_Jesper_Hallo_Kill()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_Kill_15_00");//P�i�el jsem t� zab�t.
	AI_Output (self, other,"DIA_Jesper_Hallo_Kill_09_01");//To je ale skv�l� n�pad. Na to jsi p�i�el �pln� s�m, co? No co. Zkr�t�me to.
	
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Jesper_Hallo_NurSo()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_NurSo_15_00");//Jen jsem se tu cht�l trochu rozhl�dnout.
	AI_Output (self, other,"DIA_Jesper_Hallo_NurSo_09_01");//Tady nen� nic k vid�n�. �lape� po moc nebezpe�n� p�d�, rozum�?
	AI_Output (self, other,"DIA_Jesper_Hallo_NurSo_09_02");//Tak�e nech svoji zbra�, kde je, a �ekni mi, pro� jsi tady.
};
FUNC VOID DIA_Jesper_Hallo_Willkommen()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_Willkommen_15_00");//Attila mi dal kl��. Proto jsem tady. Tak co ode m� chce�?
	AI_Output (self, other,"DIA_Jesper_Hallo_Willkommen_09_01");//To bys cht�l v�d�t? Kl�dek.
	AI_Output (self, other,"DIA_Jesper_Hallo_Willkommen_09_02");//B� se pod�vat na Cassiu. U� na tebe �ek�.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");
};
FUNC VOID DIA_Jesper_Hallo_Umgelegt()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_Umgelegt_15_00");//Sejmul jsem Attilu. M�l u sebe kl�� od stok.
	AI_Output (self, other,"DIA_Jesper_Hallo_Umgelegt_09_01");//(nev���cn�) TY jsi zabil Attilu?! (opovr�liv�) No co, stejn� to byl jen pra�ivej pes.
	AI_Output (self, other,"DIA_Jesper_Hallo_Umgelegt_09_02");//Ale n�co ti �eknu. Jestli m� napadne�, zabiju t�.
	
	Info_ClearChoices (DIA_Jesper_Hallo);
	Info_AddChoice 	  (DIA_Jesper_Hallo,"Co tady d�l�...",DIA_Jesper_Hallo_Was);	
	Info_AddChoice 	  (DIA_Jesper_Hallo,"Vezmi m� ke sv�mu v�dci.",DIA_Jesper_Hallo_Anfuehrer);
};
FUNC VOID DIA_Jesper_Hallo_Was()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_Was_15_00");//Co d�l� v t�hle tmav� vlhk� d��e?
	AI_Output (self, other,"DIA_Jesper_Hallo_Was_09_01");//(zavr��) Bydl�m tady. Je�t� jedna pitom� ot�zka a nad�l�m ti z k��e ozdobn� t��sni�ky.
};
FUNC VOID DIA_Jesper_Hallo_Anfuehrer()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_Anfuehrer_15_00");//Vezmi m� ke sv�mu v�dci.
	AI_Output (self, other,"DIA_Jesper_Hallo_Anfuehrer_09_01");//(oplzl� sm�ch) HA - m�j v�dce? Jsem si jistej, �e s tebou Cassia bude cht�t mluvit.
	AI_Output (self, other,"DIA_Jesper_Hallo_Anfuehrer_09_02");//Pokra�uj - a ��dn� srandi�ky.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");
};
//////////////////////////////////////////////////////////////////////
//	Info Lernen freischalten
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_Bezahlen   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 1;
	condition   = DIA_Jesper_Bezahlen_Condition;
	information = DIA_Jesper_Bezahlen_Info;
	permanent   = TRUE;
	description	= "M��e� m� n��emu nau�it?";
};
FUNC INT DIA_Jesper_Bezahlen_Condition()
{	
	if (Join_Thiefs == TRUE)
	&& (Jesper_TeachSneak == FALSE)
	&& (Npc_KnowsInfo (other,DIA_Cassia_Lernen))
	&& (Npc_GetTalentSkill (other, NPC_TALENT_SNEAK) == FALSE) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jesper_Bezahlen_Info()
{	
	AI_Output (other, self, "DIA_Jesper_Bezahlen_15_00");//M��e� m� n��emu nau�it?
	
	if (MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output (self, other, "DIA_Jesper_Bezahlen_09_01");//Jasn�, uk�u ti, jak se pl�it - pro tebe zadarmo.
		Jesper_TeachSneak = TRUE;
		Info_ClearChoices (DIA_Jesper_Bezahlen);
	}
	else
	{
		AI_Output (self, other, "DIA_Jesper_Bezahlen_09_02");//Chce� se nau�it, jak se pohybovat tak, aby t� nikdo nesly�el? Bude t� to st�t 100 zlat�ch.
		B_Say_Gold (self, other, Jesper_Cost);
		
		Info_ClearChoices (DIA_Jesper_Bezahlen);
		Info_AddChoice (DIA_Jesper_Bezahlen,"Mo�n� pozd�ji. (ZP�T)",DIA_Jesper_Bezahlen_Spaeter);
		Info_AddChoice (DIA_Jesper_Bezahlen,"Fajn, chci se nau�it pl�en� (zaplatit 100 zla��k�).",DIA_Jesper_Bezahlen_Okay);
	};
};
FUNC VOID DIA_Jesper_Bezahlen_Spaeter()
{
	Info_ClearChoices (DIA_Jesper_Bezahlen);
};
FUNC VOID DIA_Jesper_Bezahlen_Okay()
{
	AI_Output (other, self, "DIA_Jesper_Bezahlen_Okay_15_00");//Dobr�, chci se nau�it pl�it.
	
	if B_GiveInvItems (other, self, ItMi_Gold, 100)
	{
		AI_Output (other, self, "DIA_Jesper_Bezahlen_Okay_15_01");//Tady je zlato.
		AI_Output (self, other, "DIA_Jesper_Bezahlen_Okay_09_02");//Tak mi �ekni, a� bude� p�ipraven.
		Jesper_TeachSneak = TRUE;
		Info_ClearChoices (DIA_Jesper_Bezahlen);
	}
	else 
	{
		AI_Output (self, other, "DIA_Jesper_Bezahlen_Okay_09_03");//Bez zlata se nem��e� nau�it nic.
		Info_ClearChoices (DIA_Jesper_Bezahlen);
	};
};
//////////////////////////////////////////////////////////////////////
//	Info Schleichen 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_Schleichen   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 10;
	condition   = DIA_Jesper_Schleichen_Condition;
	information = DIA_Jesper_Schleichen_Info;
	permanent   = TRUE;
	description = "Nau� m� pros�m, jak se skr�vat.";
};
//--------------------------------------
var int DIA_Jesper_Schleichen_permanent;
//-------------------------------------- 
FUNC INT DIA_Jesper_Schleichen_Condition()
{	
	if (Jesper_TeachSneak == TRUE) 
	&& (DIA_Jesper_Schleichen_permanent == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jesper_Schleichen_Info()
{
	AI_Output (other, self, "DIA_Jesper_Schleichen_15_00");//Nau� m� um�n� pl�en�.
	
	if B_TeachThiefTalent (self, other, NPC_TALENT_SNEAK)
	{
		AI_Output (self, other, "DIA_Jesper_Schleichen_09_01");//Pl�en� je pro ka�d�ho zlod�je nepostradateln�. P�edev��m kdy� si pot�ebuje� prohl�dnout d�m n�koho jin�ho.
		AI_Output (self, other, "DIA_Jesper_Schleichen_09_02");//Prost� tam nem��e� dupat jak st�do slon�. V�t�ina lid� m� velmi lehk� sp�nek.
		AI_Output (self, other, "DIA_Jesper_Schleichen_09_03");//Jedin� kdy� se pl��, tak t� nikdo neusly�� - a m��e� neru�en� pracovat.
		DIA_Jesper_Schleichen_permanent = TRUE;
	};
};
//////////////////////////////////////////////////////////////////////
//	Info Freunde get�tet
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_Killer   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 2;
	condition   = DIA_Jesper_Killer_Condition;
	information = DIA_Jesper_Killer_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Jesper_Killer_Condition()
{	
	if Npc_IsDead (Cassia)
	|| Npc_IsDead (Ramirez)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jesper_Killer_Info()
{
	if  Npc_IsDead (Cassia)
	&&  Npc_IsDead (Ramirez)
	{
		AI_Output (self, other, "DIA_Jesper_Killer_09_00");//Zabil jsi m� p��tele. Pro� jsi to ud�lal, ty vrahu?
		AI_Output (self, other, "DIA_Jesper_Killer_09_01");//Po�lu t� p��mo na n�v�t�vu za Beliarem.
	}
	else if Npc_IsDead (Cassia)
	{
		AI_Output (self, other, "DIA_Jesper_Killer_09_02");//Zabil jsi Cassiu, ty �pinavej vrahu. Ale na m� si nep�ijde�!
		
		AI_StopProcessInfos (self);
		B_Attack (self, other, AR_NONE,1); 
	}
	else if  Npc_IsDead (Ramirez)
	{
		AI_Output (self, other, "DIA_Jesper_Killer_09_03");//Ud�lal jsem pro Ramireze v�c pr�ce a vyd�lal v�c pen�z, ne� ty kdy uvid�.
		AI_Output (self, other, "DIA_Jesper_Killer_09_04");//A tys ho jen tak zabil, ty pra�ivej pse! Je �as vyrovnat ��ty!
		
		AI_StopProcessInfos (self);
		B_Attack (self, other, AR_NONE,1); 
	};
	
};
//////////////////////////////////////////////////////////////////////
//	Info Bogen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_Bogen   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 10;
	condition   = DIA_Jesper_Bogen_Condition;
	information = DIA_Jesper_Bogen_Info;
	permanent   = FALSE;
	description = "Hele, co v� o Bosperov� luku?";
};

FUNC INT DIA_Jesper_Bogen_Condition()
{	
	if (Npc_HasItems (other, ItRw_Bow_L_03_MIS) < 1)
	&& (MIS_Bosper_Bogen == LOG_RUNNING)
	&& (Join_Thiefs == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jesper_Bogen_Info()
{
	AI_Output (other, self, "DIA_Jesper_Luk_15_00");//Hele, co v� o Bosperov� luku?
	AI_Output (self, other, "DIA_Jesper_Luk_09_01");//Mysl� ten luk od ��pa�e? Jo, m�m ho n�kde zahrabanej naho�e v truhle.
	AI_Output (self, other, "DIA_Jesper_Luk_09_02");//Ale pob�h� tam kolem spousta krys. M��e� si pro n�j doj�t, jestli ti ty potvory nevad�j.
	AI_Output (self, other, "DIA_Jesper_Luk_09_03");//Ta truhla je pochopiteln� zam�en�. Mus� se do n� vloupat. (checht� se) S trochou �t�st� ti budou tvoje pakl��e sta�it.
	
	Wld_InsertNpc (Giant_Rat, "NW_CITY_KANAL_ROOM_01_01");	
	Wld_InsertNpc (Giant_Rat, "NW_CITY_KANAL_ROOM_01_02");	
	Wld_InsertNpc (Giant_Rat, "NW_CITY_KANAL_ROOM_01_03");
};
//////////////////////////////////////////////////////////////////////
//	Info T�r
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_Tuer   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 10;
	condition   = DIA_Jesper_Tuer_Condition;
	information = DIA_Jesper_Tuer_Info;
	permanent   = FALSE;
	description = "Co je za t�mi zam�en�mi dve�mi?";
};

FUNC INT DIA_Jesper_Tuer_Condition()
{	
	if (MIS_CassiaRing == LOG_SUCCESS)
	&& (Kapitel >= 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jesper_Tuer_Info()
{
	AI_Output (other, self, "DIA_Jesper_Tuer_15_00");//Co je za t�mi zam�en�mi dve�mi?
	AI_Output (self, other, "DIA_Jesper_Tuer_09_01");//(checht� se) Je za nima ta truhla - truhla mistra z�me�n�ka.
	AI_Output (self, other, "DIA_Jesper_Tuer_09_02");//Opat�il ji tak neuv��iteln� slo�it�m z�mkem, �e ji je�t� nikdo nedok�zal otev��t.
	AI_Output (self, other, "DIA_Jesper_Tuer_09_03");//Bohu�el byl zat�en - hodili ho skrz bari�ru, kde asi vypustil du�i.
	AI_Output (self, other, "DIA_Jesper_Tuer_09_04");//Ale jestli se chce� pokusit tu truhlu otev��t, tady je kl�� od pokoje.
	
	B_GiveInvItems (self, other, ItKe_Fingers,1);
};
//////////////////////////////////////////////////////////////////////
//	Info Truhe
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_Truhe   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 10;
	condition   = DIA_Jesper_Truhe_Condition;
	information = DIA_Jesper_Truhe_Info;
	permanent   = FALSE;
	description = "Poda�ilo se mi tu truhlu otev��t.";
};

FUNC INT DIA_Jesper_Truhe_Condition()
{	
	if (Mob_HasItems ("MOB_FINGERS", Itmi_Gold) < 300)
	|| (Mob_HasItems ("MOB_FINGERS", Itmi_Silvercup) < 5)
	|| (Mob_HasItems ("MOB_FINGERS", Itmi_Goldcup) < 1)
	|| (Mob_HasItems ("MOB_FINGERS", ItAM_Strg_01) < 1)
	|| (Mob_HasItems ("MOB_FINGERS", ItPO_perm_Dex) < 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jesper_Truhe_Info()
{
	AI_Output (other, self, "DIA_Jesper_Truhe_15_00");//Poda�ilo se mi tu truhlu otev��t.
	AI_Output (self, other, "DIA_Jesper_Truhe_09_01");//To nen� mo�n�! Tak se zd�, �e m�me nov�ho mistra z�me�n�ka.
	AI_Output (self, other, "DIA_Jesper_Truhe_09_02");//K takov�mu v�konu ti mus�m pogratulovat.
	
	B_GivePlayerXP (XP_JesperTruhe);
};  


