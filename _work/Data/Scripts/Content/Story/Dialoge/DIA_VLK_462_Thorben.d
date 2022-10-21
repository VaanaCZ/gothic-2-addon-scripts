// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Thorben_EXIT(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 999;
	condition	= DIA_Thorben_EXIT_Condition;
	information	= DIA_Thorben_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Thorben_EXIT_Condition()
{
		return TRUE;
};
FUNC VOID DIA_Thorben_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Thorben_PICKPOCKET (C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 900;
	condition	= DIA_Thorben_PICKPOCKET_Condition;
	information	= DIA_Thorben_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Thorben_PICKPOCKET_Condition()
{
	C_Beklauen (30, 28);
};
 
FUNC VOID DIA_Thorben_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Thorben_PICKPOCKET);
	Info_AddChoice		(DIA_Thorben_PICKPOCKET, DIALOG_BACK 		,DIA_Thorben_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Thorben_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Thorben_PICKPOCKET_DoIt);
};

func void DIA_Thorben_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Thorben_PICKPOCKET);
};
	
func void DIA_Thorben_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Thorben_PICKPOCKET);
};

// ************************************************************
// 		NEWS - Gritta ist tot Thorben ist angepisst
// ************************************************************
INSTANCE DIA_Thorben_angepisst(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 1;
	condition	= DIA_Thorben_angepisst_Condition;
	information	= DIA_Thorben_angepisst_Info;
	permanent	= TRUE;
	important   = TRUE; 
};                       
FUNC INT DIA_Thorben_angepisst_Condition()
{	
	if (Npc_IsDead (Gritta))
	&& (Npc_IsInState (self, ZS_Talk))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_angepisst_Info()
{	
	AI_Output (self, other,"DIA_Thorben_angepisst_06_00"); //Zavra�dil jsi moji Grittu. To ti nikdy neodpust�m. B� mi z o��, vrahu!
	AI_StopProcessInfos (self);
};

// ************************************************************
// 		Hallo
// ************************************************************
INSTANCE DIA_Thorben_Hallo(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Hallo_Condition;
	information	= DIA_Thorben_Hallo_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Thorben_Hallo_Condition()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Hallo_Info()
{	
	AI_Output (self, other,"DIA_Thorben_Hallo_06_00"); //�! Nov� tv��. Ty nejsi z Khorinidu, co?
	AI_Output (self, other,"DIA_Thorben_Hallo_06_01"); //Tohle nen� ta spr�vn� doba pro poutn�ky. V�ude sam� banditi, ��dn� pr�ce a te� si je�t� za�ali vyskakovat roln�ci.
	AI_Output (self, other,"DIA_Thorben_Hallo_06_02"); //Co t� sem p�iv�d�?
};

// ************************************************************
// 		Suche Arbeit			//E1
// ************************************************************
INSTANCE DIA_Thorben_Arbeit(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Arbeit_Condition;
	information	= DIA_Thorben_Arbeit_Info;
	permanent	= FALSE;
	description = "Hled�m pr�ci.";
};                       
FUNC INT DIA_Thorben_Arbeit_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Thorben_Arbeit_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Arbeit_15_00"); //Hled�m pr�ci.
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_01"); //V� n�co o truhla�in�?
	AI_Output (other, self,"DIA_Thorben_Arbeit_15_02"); //Jedin�, co dok�u ze d�eva ud�lat, je ohe�.
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_03"); //A co z�mky?
	AI_Output (other, self,"DIA_Thorben_Arbeit_15_04"); //Noooo...
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_05"); //Je mi l�to, ale pokud o m�m �emesle nic nev�, nem��u t� pot�ebovat.
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_06"); //A nem�m pen�ze na to, abych si platil u�edn�ka.
	
	Log_CreateTopic (TOPIC_Lehrling,LOG_MISSION); 
	Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	B_LogEntry (TOPIC_Lehrling, "Thorben m� do u�en� nep�ijme.");
};

// ************************************************************
// 		Bei anderem Meister		(MIS Blessings)	//E2
// ************************************************************
INSTANCE DIA_Thorben_OtherMasters(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_OtherMasters_Condition;
	information	= DIA_Thorben_OtherMasters_Info;
	permanent	= FALSE;
	description = "Co kdybych cht�l za��t jako u�edn�k u jednoho z ostatn�ch mistr�?";
};                       
FUNC INT DIA_Thorben_OtherMasters_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Arbeit))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_OtherMasters_Info()
{	
	AI_Output (other, self,"DIA_Thorben_OtherMasters_15_00"); //Co kdybych cht�l za��t jako u�edn�k u jednoho z ostatn�ch mistr�?
	AI_Output (self, other,"DIA_Thorben_OtherMasters_06_01"); //Dobr�, d�m ti sv� doporu�en�.
	AI_Output (self, other,"DIA_Thorben_OtherMasters_06_02"); //Ale nejd��v bys m�l z�skat po�ehn�n� od boh�.
	AI_Output (self, other,"DIA_Thorben_OtherMasters_06_03"); //�ekni, jsi zbo�n� mu�?
	
	Info_ClearChoices (DIA_Thorben_OtherMasters);
	if (other.guild != GIL_KDF)
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_PAL)
	{
		Info_AddChoice (DIA_Thorben_OtherMasters, "No, kdy� mysl�, �e bych se m�l modlit pravideln�...", DIA_Thorben_OtherMasters_Naja);
	};
	Info_AddChoice (DIA_Thorben_OtherMasters, "Ano. Nejpokorn�j�� slu�ebn�k, mist�e Thorbne.", DIA_Thorben_OtherMasters_Devoutly);
};

func void B_Thorben_GetBlessings()
{
	AI_Output (self, other,"B_Thorben_GetBlessings_06_00"); //Tak to jdi za Vatrasem, Adanov�m kn�zem, a popros ho, a� ti po�ehn�.
	if (other.guild != GIL_KDF)
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_PAL)
	{
		AI_Output (self, other,"B_Thorben_GetBlessings_06_01"); //On u� ti �ekne, kde naj�t Innosovy kn�ze. Taky od n�j m��e� dostat po�ehn�n�.
	};
	AI_Output (self, other,"B_Thorben_GetBlessings_06_02"); //Jakmile z�sk� po�ehn�n�, m� m�j souhlas.
	
	MIS_Thorben_GetBlessings = LOG_RUNNING;
	
	Log_CreateTopic(TOPIC_Thorben,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Thorben,LOG_RUNNING);
	B_LogEntry (TOPIC_Thorben,"Thorben se za m� p�imluv� teprve tehdy, a� si vypros�m po�ehn�n� od Adanova a Innosova kn�ze.");
};

func void DIA_Thorben_OtherMasters_Devoutly()
{
	AI_Output (other, self,"DIA_Thorben_OtherMasters_Devoutly_15_00"); //Ano. Nejpokorn�j�� slu�ebn�k, mist�e Thorbene.
	B_Thorben_GetBlessings();
	
	Info_ClearChoices (DIA_Thorben_OtherMasters);
};

func void DIA_Thorben_OtherMasters_Naja()
{
	AI_Output (other, self,"DIA_Thorben_OtherMasters_Naja_15_00"); //No, kdy� mysl�, �e bych se m�l modlit pravideln�...
	AI_Output (self, other,"DIA_Thorben_OtherMasters_Naja_06_01"); //J� si to nemysl�m. V�m to!
	AI_Output (self, other,"DIA_Thorben_OtherMasters_Naja_06_02"); //N�kdo, kdo nen� dostate�n� zbo�n�, m�j souhlas nikdy nez�sk�.
	AI_Output (self, other,"DIA_Thorben_OtherMasters_Naja_06_03"); //Pros bohy za shov�vavost nad tv�mi h��chy.
	B_Thorben_GetBlessings();
	
	Info_ClearChoices (DIA_Thorben_OtherMasters);
};

// ************************************************************
// 		ZUSTIMMUNG		//E3  (PERM)
// ************************************************************
INSTANCE DIA_Thorben_ZUSTIMMUNG(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 1;
	condition	= DIA_Thorben_ZUSTIMMUNG_Condition;
	information	= DIA_Thorben_ZUSTIMMUNG_Info;
	permanent	= TRUE;
	description = "Tak jak s t�m doporu�en�m, mist�e?";
};                       
FUNC INT DIA_Thorben_ZUSTIMMUNG_Condition()
{	
	if (Player_IsApprentice == APP_NONE)
	&& (MIS_Thorben_GetBlessings == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_ZUSTIMMUNG_Info()
{	
	AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_00"); //Tak jak s t�m doporu�en�m, mist�e?
	AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_01"); //Po�ehnal ti Vatras?
	
	if (Vatras_Segen == TRUE)
	{
		AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_02"); //Ano.
		AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_03"); //A z�skal jsi tak� po�ehn�n� Innose?
		
		if (Daron_Segen == TRUE)
		|| (Isgaroth_Segen == TRUE)
		|| (other.guild == GIL_KDF)
		{
			AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_04"); //Ano, z�skal.
			AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_05"); //V tom p��pad� m� i m� po�ehn�n�. Nez�le�� na tom, jakou cestu sis vybral - bu� hrd� na svou pr�ci, chlap�e!
			
			MIS_Thorben_GetBlessings = LOG_SUCCESS;
			B_GivePlayerXP (XP_Zustimmung);
			
			Log_CreateTopic (TOPIC_Lehrling,LOG_MISSION);
			Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
			B_LogEntry (TOPIC_Lehrling,"Budu-li k n�komu cht�t vstoupit do u�en�, Thorben se za m� p�imluv�.");
		}
		else
		{
			AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_06"); //Ne. Je�t� ne.
			AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_07"); //Zn� moje podm�nky. Sv�m z�le�itostem se m��e� v�novat jen s po�ehn�n�m boh�.
		};
	}
	else
	{
		AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_08"); //Je�t� ne...
		AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_09"); //V tom p��pad� nev�m, pro� se m� znovu pt�. Zn� moje podm�nky.
	};
};

// ************************************************************
// 		Was wei�t du �ber Schl�sser?		//E2
// ************************************************************
INSTANCE DIA_Thorben_Locksmith(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Locksmith_Condition;
	information	= DIA_Thorben_Locksmith_Info;
	permanent	= FALSE;
	description = "Tak ty se vyzn� v z�mc�ch?";
};                       
FUNC INT DIA_Thorben_Locksmith_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Arbeit))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Locksmith_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Locksmith_15_00"); //Tak ty se vyzn� v z�mc�ch?
	AI_Output (self, other,"DIA_Thorben_Locksmith_06_01"); //Co by to bylo za po��dnou truhlu bez dobr�ho z�mku?
	AI_Output (self, other,"DIA_Thorben_Locksmith_06_02"); //Vyr�b�m si sv� vlastn� z�mky. Takhle si m��u b�t p�inejmen��m jist�, �e jsem neud�lal bytelnou truhlu jen tak pro nic za nic.
	AI_Output (self, other,"DIA_Thorben_Locksmith_06_03"); //Odbyt� z�mek se d� snadno zlomit. A tady v Khorinidu se v�ude kolem potuluje spousta zlod�j�. Zvl�t� posledn� dobou!
};

// ************************************************************
// 		Schuldenbuch
// ************************************************************
INSTANCE DIA_Thorben_Schuldenbuch(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Schuldenbuch_Condition;
	information	= DIA_Thorben_Schuldenbuch_Info;
	permanent	= FALSE;
	description = "M�m tady Lehmarovu ��etn� knihu...";
};                       
FUNC INT DIA_Thorben_Schuldenbuch_Condition()
{	
	if (Npc_HasItems (other, ItWr_Schuldenbuch) > 0)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Schuldenbuch_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Schuldenbuch_15_00"); //M�m tady Lehmarovu ��etn� knihu.
	AI_Output (self, other,"DIA_Thorben_Schuldenbuch_06_01"); //(podez�rav�) Jak ses k tomu dostal?
	AI_Output (other, self,"DIA_Thorben_Schuldenbuch_15_02"); //Sp� by t� m�lo zaj�mat, �e je v n� tv� jm�no.
	AI_Output (self, other,"DIA_Thorben_Schuldenbuch_06_03"); //Dej to sem!
	B_GiveInvItems (other, self, ItWr_Schuldenbuch, 1);
	AI_Output (other, self,"DIA_Thorben_Schuldenbuch_15_04"); //A co mi za to d�?
	AI_Output (self, other,"DIA_Thorben_Schuldenbuch_06_05"); //Nem�m pen�ze nazbyt a nem��u ti d�t nic jin�ho ne� m� srde�n� pod�kov�n�.
	B_GivePlayerXP (XP_Schuldenbuch);
};

// ************************************************************
// 		Kann ich Schl�sser knacken lernen		//E3
// ************************************************************
INSTANCE DIA_Thorben_PleaseTeach(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_PleaseTeach_Condition;
	information	= DIA_Thorben_PleaseTeach_Info;
	permanent	= TRUE;
	description = "M��e� m� nau�it, jak p��it z�mky?";
};                       
FUNC INT DIA_Thorben_PleaseTeach_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Locksmith))
	&& (Thorben_TeachPlayer == FALSE)
	&& (Npc_GetTalentSkill (other, NPC_TALENT_PICKLOCK) == 0)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_PleaseTeach_Info()
{	
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_15_00"); //M��e� m� nau�it, jak p��it z�mky?
		
	if (Npc_HasItems (self, ItWr_Schuldenbuch) > 0)
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_01"); //Kdyby nebylo tebe, budu Lehmarovi platit po cel� zbytek sv�ho �ivota.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_02"); //Nau��m t�, co bude� cht�t.
		Thorben_TeachPlayer = TRUE;
	}
	else if (Thorben_GotGold == TRUE) //100 Gold bekommen
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_03"); //P�inesl jsi mi 100 zlat�ch. To od tebe bylo velmi mil�.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_04"); //P�iv�d� m� to do rozpak�, ale mus�m t� po��dat je�t� o jednu laskavost.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_05"); //Jeliko� v dohledn� dob� nem��u Lehmarovi sv�j dluh splatit, chyst� se na m� poslat ty sv� gorily.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_06"); //Dej mi je�t� dal��ch 100 zlat�ch a j� t� za�nu u�it.

		Info_ClearChoices (DIA_Thorben_PleaseTeach);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "Kolik?", DIA_Thorben_PleaseTeach_Later);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "Dobr�. Tady je 100 zlat�ch.", DIA_Thorben_PleaseTeach_Pay100);
	}
	else if (MIS_Matteo_Gold == LOG_SUCCESS) //Grittas Schulden bezahlt
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_07"); //Zaplatil jsi Grittin dluh u Mattea. Vypad� jako spr�vn� chlap. Nau��m t�, co bude� cht�t.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_08"); //Nicm�n� nem��u to d�lat zadarmo. Je�t� po��d m�m f�ru dluh� a pot�ebuju pen�ze.
		AI_Output (other, self,"DIA_Thorben_PleaseTeach_15_09"); //Kolik?
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_10"); //200 zlat�ch.
		
		Info_ClearChoices (DIA_Thorben_PleaseTeach);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "Kolik?", DIA_Thorben_PleaseTeach_Later);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "Dobr�. Tady je 200 zlat�ch.", DIA_Thorben_PleaseTeach_Pay200);
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_11"); //Hmm... nev�m, jestli se ti d� v��it, nebo ne.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_12"); //Podle toho, co v�m, m��e� klidn� b�t jedn�m z t�ch darmo�lap�, co p�i�li do m�sta jen proto, aby vypr�zdnili truhlice bohat�ch lid�.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_13"); //Nebudu t� u�it nic, dokud se nep�esv�d��m, �e jsi dobr� �lov�k.
	};
};

func void DIA_Thorben_PleaseTeach_Pay200()
{
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_Pay200_15_00"); //Dobr�. Tady je 200 zlat�ch.
	
	if (B_GiveInvItems (other, self, ItMi_Gold, 200))
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay200_06_01"); //Tyhle pen�ze by mi m�ly pomoct. M��eme za��t hned, jak bude� p�ipraven.
		Thorben_TeachPlayer = TRUE;
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay200_06_02"); //Je�t� po��d ti do 200 zlat�ch p�r minc� chyb�. Ty pen�ze pot�ebuju.
	};
	
	Info_ClearChoices (DIA_Thorben_PleaseTeach);
};

func void DIA_Thorben_PleaseTeach_Pay100()
{	
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_Pay100_15_00"); //Dobr�. Tady je 100 zlat�ch.
		
	if (B_GiveInvItems (other, self, ItMi_Gold, 100))
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay100_06_01"); //V tom p��pad� m��eme za��t hned, jak bude� p�ipraven.
		Thorben_TeachPlayer = TRUE;
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay100_06_02"); //Hej, je�t� po��d ti do 100 zlat�ch chyb� p�r minc�.
	};
	
	Info_ClearChoices (DIA_Thorben_PleaseTeach);
};
	
func void DIA_Thorben_PleaseTeach_Later()
{	
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_Later_15_00"); //Mo�n� pozd�ji.

	Info_ClearChoices (DIA_Thorben_PleaseTeach);
};

// ************************************************************
// 		Schl�sser knacken lernen		//E4
// ************************************************************
INSTANCE DIA_Thorben_Teach(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Teach_Condition;
	information	= DIA_Thorben_Teach_Info;
	permanent	= TRUE;
	description = B_BuildLearnString("Nau� m� p��it z�mky!", B_GetLearnCostTalent(other, NPC_TALENT_PICKLOCK, 1));
};                       
FUNC INT DIA_Thorben_Teach_Condition()
{	
	if (Thorben_TeachPlayer == TRUE)
	&& (Npc_GetTalentSkill (other, NPC_TALENT_PICKLOCK) == 0)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Teach_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Teach_15_00"); //Nau� m� p��it z�mky!
	
	if B_TeachThiefTalent (self, other, NPC_TALENT_PICKLOCK)
	{
		AI_Output (self, other,"DIA_Thorben_Teach_06_01"); //Pot�ebuje� akor�t n�jak� pakl��. Pokud j�m bude� v z�mku opatrn� ot��et doprava a doleva, m��e� mechanismus otev��t.
		AI_Output (self, other,"DIA_Thorben_Teach_06_02"); //Ale pokud oto�� p��li� rychle nebo moc siln� ve �patn�m sm�ru, pakl�� se zlom�.
		AI_Output (self, other,"DIA_Thorben_Teach_06_03"); //��m bude� obratn�j��, t�m m�n� bude� pot�ebovat pakl���. To je v�echno, opravdu.
	};
};

// ************************************************************
// 		TRADE (PERM)
// ************************************************************
INSTANCE DIA_Thorben_TRADE(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 3;
	condition	= DIA_Thorben_TRADE_Condition;
	information	= DIA_Thorben_TRADE_Info;
	permanent	= TRUE;
	description = "M��e� mi prodat n�jak� pakl��e?";
	trade		= TRUE;
};                       
FUNC INT DIA_Thorben_TRADE_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Locksmith))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_TRADE_Info()
{	
	AI_Output (other, self,"DIA_Thorben_TRADE_15_00"); //M��e� mi prodat n�jak� pakl��e?
	
	if (Npc_GetTalentSkill (other, NPC_TALENT_PICKLOCK) > 0)
	{
		AI_Output (self, other,"DIA_Thorben_TRADE_06_01"); //Pokud mi je�t� n�jak� zbyly...
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_TRADE_06_02"); //No tak dobr�. Ale dokud nev�, jak s nimi zach�zet, tak ti budou k ni�emu.
	};
	
	if (Npc_HasItems (self, ITke_Lockpick) == 0) 
	&& (Kapitel > Dietrichgeben) 
	{
		CreateInvItems (self, ITKE_LOCKPICK,5);
		Dietrichgeben = Dietrichgeben +1;
	};
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Tesa� Thorben prod�v� pakl��e."); 
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Thorben_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_462_Thorben;
	nr		 = 	4;
	condition	 = 	DIA_Addon_Thorben_MissingPeople_Condition;
	information	 = 	DIA_Addon_Thorben_MissingPeople_Info;

	description	 = 	"Ty u� jsi n�kdy n�jak�ho u�edn�ka m�l?";
};

func int DIA_Addon_Thorben_MissingPeople_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Thorben_Arbeit))
	&& (SC_HearedAboutMissingPeople == TRUE)
	&& (Elvrich_GoesBack2Thorben == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Thorben_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Thorben_MissingPeople_15_00"); //U� jsi n�kdy m�l n�jak�ho u�edn�ka?
	AI_Output	(self, other, "DIA_Addon_Thorben_MissingPeople_06_01"); //Jo, a ani to nen� tak d�vno.
	AI_Output	(other, self, "DIA_Addon_Thorben_MissingPeople_15_02"); //A co se stalo?
	AI_Output	(self, other, "DIA_Addon_Thorben_MissingPeople_06_03"); //Jmenoval se Elvrich. Byl to m�j synovec.
	AI_Output	(self, other, "DIA_Addon_Thorben_MissingPeople_06_04"); //A byl jsem s n�m docela spokojen�, ale jednoho dne prost� nep�i�el do pr�ce.
	
	MIS_Thorben_BringElvrichBack = LOG_RUNNING;

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Elvrich, u�edn�k tesa�e Thorbena, zmizel."); 
	
	Info_ClearChoices	(DIA_Addon_Thorben_MissingPeople);
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, DIALOG_BACK, DIA_Addon_Thorben_MissingPeople_Back );
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, "A ohl�sil jsi to domobran�?", DIA_Addon_Thorben_MissingPeople_Mil );
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, "Jak je to dlouho, co jsi ho vid�l naposledy?", DIA_Addon_Thorben_MissingPeople_wann );
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, "Kde je Elvrich te�?", DIA_Addon_Thorben_MissingPeople_where );
};

func void DIA_Addon_Thorben_MissingPeople_Back ()
{
	Info_ClearChoices	(DIA_Addon_Thorben_MissingPeople);
};

func void DIA_Addon_Thorben_MissingPeople_wann ()
{
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_wann_15_00"); //Jak je to dlouho, co jsi ho nevid�l?
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_wann_06_01"); //Asi tak �trn�ct dn�.
};

func void DIA_Addon_Thorben_MissingPeople_where ()
{
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_where_15_00"); //Kde je Elvrich te�?
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_where_06_01"); //Jak to m�m v�d�t? Ale furt se poflakoval kolem toho �pinav�ho bordelu v p��stavu.
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_where_06_02"); //Ani by m� nep�ekvapilo, kdyby si tam je�t� te� u��val s n�jakou �t�tkou.
};

func void DIA_Addon_Thorben_MissingPeople_Mil ()
{
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_Mil_15_00"); //Ohl�sil jsi to domobran�?
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_Mil_06_01"); //Samoz�ejm�. M�li ho chytit a dohl�dnout, aby se ta l�n� k��e vr�tila zp�tky do pr�ce. Ale j� u� to stejn� zabalil.
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_Mil_06_02"); //A� si d�l�, co chce. D��v nebo pozd�ji stejn� zjist�, �e bez slu�n� pr�ce si v Khorinidu ne�krtne.
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_Mil_15_03"); //(cynicky) Opravdu?
};

///////////////////////////////////////////////////////////////////////
//	Info ElvrichIsBack
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Thorben_ElvrichIsBack		(C_INFO)
{
	npc		 = 	VLK_462_Thorben;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Thorben_ElvrichIsBack_Condition;
	information	 = 	DIA_Addon_Thorben_ElvrichIsBack_Info;

	description	 = 	"Elvrich pro tebe bude od nyn�j�ka znovu pracovat.";
};

func int DIA_Addon_Thorben_ElvrichIsBack_Condition ()
{
	if (Elvrich_GoesBack2Thorben == TRUE)
	&& ((Npc_IsDead(Elvrich)) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorben_ElvrichIsBack_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Thorben_ElvrichIsBack_15_00"); //Odte�ka pro tebe bude Elvrich znovu pracovat.
	AI_Output	(self, other, "DIA_Addon_Thorben_ElvrichIsBack_06_01"); //M��u jenom doufat, �e nezmiz� znova, a� se kolem ochom�tne n�jak� sukn�.
	AI_Output	(self, other, "DIA_Addon_Thorben_ElvrichIsBack_06_02"); //Za to, �e jsi mi p�ivedl u�edn�ka, si vezmi tohle zlato.
	CreateInvItems (self, ItMi_Gold, 200);									
	B_GiveInvItems (self, other, ItMi_Gold, 200);
	MIS_Thorben_BringElvrichBack = LOG_SUCCESS;
	VLK_4302_Addon_Elvrich.flags = 0;
};

// ************************************************************
// 		Paladine		//E1
// ************************************************************
INSTANCE DIA_Thorben_Paladine(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 4;
	condition	= DIA_Thorben_Paladine_Condition;
	information	= DIA_Thorben_Paladine_Info;
	permanent	= FALSE;
	description = "Co v� o paladinech?";
};                       
FUNC INT DIA_Thorben_Paladine_Condition()
{	
	if (other.guild != GIL_PAL)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Thorben_Paladine_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Paladine_15_00"); //Co v� o paladinech?
	AI_Output (self, other,"DIA_Thorben_Paladine_06_01"); //Nic moc. P�ed dv�ma t�dny sem na lodi p�ipluli z pevniny.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_02"); //Od t� doby jsou zav�en� v horn� ��sti m�sta.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_03"); //Nikdo tady po��dn� nev�, pro� vlastn� p�ijeli.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_04"); //Hodn� lid� se ob�v� �toku sk�et�.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_05"); //Ale j� si stejn� mysl�m, �e jsou tu kv�li rolnick� vzpou�e.
};

// ************************************************************
// 		Bauernaufstand		//E2
// ************************************************************
INSTANCE DIA_Thorben_Bauernaufstand(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 4;
	condition	= DIA_Thorben_Bauernaufstand_Condition;
	information	= DIA_Thorben_Bauernaufstand_Info;
	permanent	= FALSE;
	description = "V� n�co o t� rolnick� vzpou�e?";
};                       
FUNC INT DIA_Thorben_Bauernaufstand_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Paladine))
	&& (other.guild != GIL_SLD)
	&& (other.guild != GIL_DJG)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Bauernaufstand_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Bauernaufstand_15_00"); //V� n�co o t� rolnick� vzpou�e?
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_01"); //Pov�d� se, �e si velkostatk�� Onar najal �oldn��e, aby ho chr�nili p�ed kr�lovsk�mi vojsky.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_02"); //Asi u� m�l dost toho, �e mu paladinov� a domobrana po��d berou �rodu a dobytek.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_03"); //Jedin�, co jsme tady ve m�st� zaznamenali, je neust�l� zvy�ov�n� cen potravin.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_04"); //Onarova farma le�� na v�chod odsud, je to docela daleko. Nev�me, jestli se tam k n��emu chyst�.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_05"); //Pokud se chce� dozv�d�t v�c, zeptej se kupc� na tr�i�ti. Maj� o ostrov� v�t�� p�ehled ne� j�.
};

// ************************************************************
// 		Gritta
// ************************************************************
INSTANCE DIA_Thorben_Gritta(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 5;
	condition	= DIA_Thorben_Gritta_Condition;
	information	= DIA_Thorben_Gritta_Info;
	permanent	= FALSE;
	description = "P�i�el jsem kv�li Gritt�...";
};                       
FUNC INT DIA_Thorben_Gritta_Condition()
{	
	if (MIS_Matteo_Gold == LOG_RUNNING)
	&& (!Npc_IsDead (Gritta))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Gritta_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Gritta_15_00"); //P�i�el jsem kv�li Gritt�.
	AI_Output (self, other,"DIA_Thorben_Gritta_06_01"); //M� nete�i? O co jde? Nen� to nic s pen�zi, �e ne?
	AI_Output (other, self,"DIA_Thorben_Gritta_15_02"); //Dlu�� 100 zlat�ch kupci Matteovi.
	
	AI_Output (self, other,"DIA_Thorben_Gritta_06_03"); //�ekni, �e to nen� pravda. Od t� doby, co se ke mn� ta mal� leno�ka nast�hovala, m�m jen sam� pot�e!
	AI_Output (self, other,"DIA_Thorben_Gritta_06_04"); //M� dluh snad u ka�d�ho kupce ve m�st�.
	AI_Output (self, other,"DIA_Thorben_Gritta_06_05"); //Musel jsem si p�j�it 200 zlat�ch u lichv��e jen proto, abych vyrovnal jej� dluhy. A te� tohle!
	if (Npc_GetDistToWP(self, "NW_CITY_MERCHANT_SHOP01_FRONT_01") < 500)
	{
		AI_Output (self, other,"DIA_Thorben_Gritta_06_06"); //Gritta by m�la b�t v dom�.
	};
	AI_Output (self, other,"DIA_Thorben_Gritta_06_07"); //Jdi d�l, jen se j� zeptej. Ale m��u ti ��ct jedno: nem� ani zlatku.
	if (Npc_HasItems(Gritta, itmi_gold) >= 100)
	{
		AI_Output (other, self,"DIA_Thorben_Gritta_15_08"); //Uvid�me...
	};
};

// ************************************************************
// 		Grittas Gold genommen
// ************************************************************
INSTANCE DIA_Thorben_GrittaHatteGold(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 5;
	condition	= DIA_Thorben_GrittaHatteGold_Condition;
	information	= DIA_Thorben_GrittaHatteGold_Info;
	permanent	= FALSE;
	description = "Tv� nete� mi dala 100 zlat�ch.";
};                       
FUNC INT DIA_Thorben_GrittaHatteGold_Condition()
{	
	if (Npc_KnowsInfo(other, DIA_Thorben_Gritta))
	&& (Npc_HasItems(Gritta, itmi_gold) < 100)
	&& (!Npc_IsDead (Gritta))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_GrittaHatteGold_Info()
{	
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_15_00"); //Tv� nete� mi dala 100 zlat�ch.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_06_01"); //CO? Ta mal� nestydat� zmije - to bylo MOJE zlato! Vzala ho z m� truhly.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_06_02"); //Vra� mi to! Mus�m nejd��v zaplatit Lehmarovi. Matteo dostane sv� pen�ze pozd�ji!

	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
	if (MIS_Matteo_Gold == LOG_SUCCESS)
	{
		Info_AddChoice (DIA_Thorben_GrittaHatteGold, "U� jsem dal Matteovi jeho zlato!", DIA_Thorben_GrittaHatteGold_MatteoHatEs);
	}
	else
	{
		Info_AddChoice (DIA_Thorben_GrittaHatteGold, "Ne. Ty pen�ze jsou Matteovy.", DIA_Thorben_GrittaHatteGold_MatteoSollHaben);
	};

	if (Npc_HasItems(other, itmi_gold) >= 100)
	{
		Info_AddChoice (DIA_Thorben_GrittaHatteGold, "Tady je zlato.", DIA_Thorben_GrittaHatteGold_HereItIs);
	};
};

func void B_Thorben_DeletePetzCrimeGritta()
{
	if (Gritta_GoldGiven == FALSE)
	{
		AI_Output (self, other,"B_Thorben_DeletePetzCrimeGritta_06_00"); //A co v�m o t� mal� zmiji, jsem si jist�, �e b�ela p��mo za m�stskou str��, aby t� taky obvinila!
		AI_Output (self, other,"B_Thorben_DeletePetzCrimeGritta_06_01"); //Dohl�dnu na to, aby se to n�jak vy�e�ilo.
		B_DeletePetzCrime (Gritta);
	};
};

func void DIA_Thorben_GrittaHatteGold_MatteoHatEs()
{
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_MatteoHatEs_15_00"); //U� jsem dal Matteovi jeho zlato!
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_MatteoHatEs_06_01"); //Sakra! Dobr� - dluh je dluh. Alespo� �e sis ty pen�ze nenechal. Asi bych ti za to m�l pod�kovat.
	
	B_Thorben_DeletePetzCrimeGritta();
	
	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
};

func void DIA_Thorben_GrittaHatteGold_MatteoSollHaben()
{
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_15_00"); //Ne. Ty pen�ze jsou Matteovy.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_01"); //Takhle m� dostane� do po��dn�ch trabl�. Lehmar nen� zrovna p�ehnan� shov�vav�, kdy� p�ijde �e� na dluhy.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_02"); //Ale p�inejmen��m se chyst� splatit dluh m� nete�e. Asi bych ti za to m�l pod�kovat.
	
	B_Thorben_DeletePetzCrimeGritta();
	
	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
};

func void DIA_Thorben_GrittaHatteGold_HereItIs()
{
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_HereItIs_15_00"); //Tady je zlato.
	B_GiveInvItems(other, self, itmi_gold, 100);
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_HereItIs_06_01"); //D�ky! Kone�n� m�m alespo� ��st pen�z, co dlu��m Lehmarovi.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_HereItIs_06_02"); //Nem��u uv��it tomu, �e m�la tu drzost vz�t m� zlato!
	
	B_Thorben_DeletePetzCrimeGritta();
	
	Thorben_GotGold = TRUE;
	
	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
};



















