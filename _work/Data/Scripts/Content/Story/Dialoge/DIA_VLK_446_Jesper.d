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
	AI_Output (self, other,"DIA_Jesper_Hallo_09_00");//Co tu robisz? Nie masz tu czego szuka�.
	AI_Output (self, other,"DIA_Jesper_Hallo_09_01");//No dobra, co tu robisz?
		
	Info_ClearChoices (DIA_Jesper_Hallo);
	Info_AddChoice 	  (DIA_Jesper_Hallo,"Zamierzam ci� zabi�.",DIA_Jesper_Hallo_Kill);	
	Info_AddChoice 	  (DIA_Jesper_Hallo,"Chcia�em troch� pozwiedza�.",DIA_Jesper_Hallo_NurSo);
		
	if  (Attila_Key == TRUE)
	{
		Info_AddChoice 	  (DIA_Jesper_Hallo,"Attila da� mi klucz... ",DIA_Jesper_Hallo_Willkommen);
	}	
	else 
	{
		Info_AddChoice 	  (DIA_Jesper_Hallo,"Za�atwi�em Attil�...",DIA_Jesper_Hallo_Umgelegt);
	};
	
	DG_gefunden = TRUE;
	
};
FUNC VOID DIA_Jesper_Hallo_Kill()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_Kill_15_00");//Zamierzam ci� zabi�.
	AI_Output (self, other,"DIA_Jesper_Hallo_Kill_09_01");//C� za wspania�y pomys�. Sam na niego wpad�e�, co? A co tam. Nie b�d� przed�u�a�.
	
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Jesper_Hallo_NurSo()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_NurSo_15_00");//Chcia�em troch� pozwiedza�.
	AI_Output (self, other,"DIA_Jesper_Hallo_NurSo_09_01");//Nie ma si� na co gapi�. Wkraczasz na grz�ski grunt, jasne?
	AI_Output (self, other,"DIA_Jesper_Hallo_NurSo_09_02");//Wi�c nie ruszaj broni i powiedz mi, dlaczego tu jeste�.
};
FUNC VOID DIA_Jesper_Hallo_Willkommen()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_Willkommen_15_00");//Attila da� mi klucz. Dlatego tu jestem. Wi�c czego ode mnie chcesz?
	AI_Output (self, other,"DIA_Jesper_Hallo_Willkommen_09_01");//Chcia�by� wiedzie�? Spokojnie.
	AI_Output (self, other,"DIA_Jesper_Hallo_Willkommen_09_02");//Id� do Cassii. Czeka na ciebie.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");
};
FUNC VOID DIA_Jesper_Hallo_Umgelegt()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_Umgelegt_15_00");//Za�atwi�em Attil�. Mia� przy sobie klucz do kana��w.
	AI_Output (self, other,"DIA_Jesper_Hallo_Umgelegt_09_01");//Zabi�e� Attil�? No i co z tego, to by� n�dzny pies.
	AI_Output (self, other,"DIA_Jesper_Hallo_Umgelegt_09_02");//Powiem ci co�. Je�li mnie zaatakujesz, zabij� ci�.
	
	Info_ClearChoices (DIA_Jesper_Hallo);
	Info_AddChoice 	  (DIA_Jesper_Hallo,"Co ty tu robisz...",DIA_Jesper_Hallo_Was);	
	Info_AddChoice 	  (DIA_Jesper_Hallo,"Chc� si� zobaczy� z twoim przyw�dc�.",DIA_Jesper_Hallo_Anfuehrer);
};
FUNC VOID DIA_Jesper_Hallo_Was()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_Was_15_00");//Co robisz w tej ciemnej, wilgotnej norze?
	AI_Output (self, other,"DIA_Jesper_Hallo_Was_09_01");//Mieszkam tu. Jeszcze jedno g�upie pytanie, a wytn� ci na sk�rze wzorek.
};
FUNC VOID DIA_Jesper_Hallo_Anfuehrer()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_Anfuehrer_15_00");//Chc� si� zobaczy� z twoim przyw�dc�.
	AI_Output (self, other,"DIA_Jesper_Hallo_Anfuehrer_09_01");//HA - moim przyw�dc�? Jestem pewien, �e Cassia ch�tnie z tob� porozmawia.
	AI_Output (self, other,"DIA_Jesper_Hallo_Anfuehrer_09_02");//Id� - i nie pr�buj �adnych sztuczek.
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
	description	= "Mo�esz mnie czego� nauczy�?";
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
	AI_Output (other, self, "DIA_Jesper_Bezahlen_15_00");//Mo�esz mnie czego� nauczy�?
	
	if (MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output (self, other, "DIA_Jesper_Bezahlen_09_01");//Pewnie, poka�� ci, jak si� skrada� - za darmo.
		Jesper_TeachSneak = TRUE;
		Info_ClearChoices (DIA_Jesper_Bezahlen);
	}
	else
	{
		AI_Output (self, other, "DIA_Jesper_Bezahlen_09_02");//Chcesz si� nauczy�, jak si� bezszelestnie porusza�? To ci� b�dzie kosztowa� 100 sztuk z�ota.
		B_Say_Gold (self, other, Jesper_Cost);
		
		Info_ClearChoices (DIA_Jesper_Bezahlen);
		Info_AddChoice (DIA_Jesper_Bezahlen,"Mo�e p�niej... (POWR�T)",DIA_Jesper_Bezahlen_Spaeter);
		Info_AddChoice (DIA_Jesper_Bezahlen,"Chc� si� nauczy� sztuki skradania (zap�a� 100 sztuk z�ota).",DIA_Jesper_Bezahlen_Okay);
	};
};
FUNC VOID DIA_Jesper_Bezahlen_Spaeter()
{
	Info_ClearChoices (DIA_Jesper_Bezahlen);
};
FUNC VOID DIA_Jesper_Bezahlen_Okay()
{
	AI_Output (other, self, "DIA_Jesper_Bezahlen_Okay_15_00");//Dobra, chc� si� nauczy� skradania.
	
	if B_GiveInvItems (other, self, ItMi_Gold, 100)
	{
		AI_Output (other, self, "DIA_Jesper_Bezahlen_Okay_15_01");//Oto z�oto.
		AI_Output (self, other, "DIA_Jesper_Bezahlen_Okay_09_02");//Daj mi zna�, jak b�dziesz gotowy.
		Jesper_TeachSneak = TRUE;
		Info_ClearChoices (DIA_Jesper_Bezahlen);
	}
	else 
	{
		AI_Output (self, other, "DIA_Jesper_Bezahlen_Okay_09_03");//Bez z�ota niczego si� nie nauczysz.
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
	description = "Naucz mnie zasad skradania i ukrywania si�.";
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
	AI_Output (other, self, "DIA_Jesper_Schleichen_15_00");//Naucz mnie sztuki skradania si�.
	
	if B_TeachThiefTalent (self, other, NPC_TALENT_SNEAK)
	{
		AI_Output (self, other, "DIA_Jesper_Schleichen_09_01");//Umiej�tno�� skradania si� jest niezwykle wa�na dla ka�dego z�odzieja. Przede wszystkim do poruszania si� po cudzych domach.
		AI_Output (self, other, "DIA_Jesper_Schleichen_09_02");//Nie tup tak. Wi�kszo�� ludzi ma bardzo czujny sen.
		AI_Output (self, other, "DIA_Jesper_Schleichen_09_03");//Je�li b�dziesz si� skrada�, nikt ci� nie us�yszy - wtedy b�dziesz m�g� pracowa� bez przeszk�d.
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
		AI_Output (self, other, "DIA_Jesper_Killer_09_00");//Zabi�e� moich przyjaci�. Dlaczego to zrobi�e�, morderco?
		AI_Output (self, other, "DIA_Jesper_Killer_09_01");//Wy�l� ci� do kr�lestwa Beliara.
	}
	else if Npc_IsDead (Cassia)
	{
		AI_Output (self, other, "DIA_Jesper_Killer_09_02");//Zabi�e� Cassi�, ty parszywy morderco. Mnie jednak nie pokonasz!
		
		AI_StopProcessInfos (self);
		B_Attack (self, other, AR_NONE,1); 
	}
	else if  Npc_IsDead (Ramirez)
	{
		AI_Output (self, other, "DIA_Jesper_Killer_09_03");//Wy�wiadczy�em Ramirezowi wi�cej przys�ug i zebra�em wi�cej got�wki, ni� kiedykolwiek widzia�e�.
		AI_Output (self, other, "DIA_Jesper_Killer_09_04");//A ty go zabi�e�, wredny psie! Pora za to zap�aci�!
		
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
	description = "Nie wiesz przypadkiem czego� o �uku Bospera?";
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
	AI_Output (other, self, "DIA_Jesper_Bogen_15_00");//Nie wiesz przypadkiem czego� o �uku Bospera?
	AI_Output (self, other, "DIA_Jesper_Bogen_09_01");//Chodzi ci o ten �uk od �uczarza? Taak, mam go gdzie� w skrzyni.
	AI_Output (self, other, "DIA_Jesper_Bogen_09_02");//Pe�no tam jednak szczur�w. Mo�esz go przynie��, je�li si� nie boisz.
	AI_Output (self, other, "DIA_Jesper_Bogen_09_03");//Och, oczywi�cie skrzynia jest zamkni�ta. B�dziesz musia� si� w�ama�. Na szcz�cie wci�� masz wytrychy.
	
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
	description = "Co jest za tymi zamkni�tymi drzwiami?";
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
	AI_Output (other, self, "DIA_Jesper_Tuer_15_00");//Co jest za tymi zamkni�tymi drzwiami?
	AI_Output (self, other, "DIA_Jesper_Tuer_09_01");//Dalej jest skrzynia - wyzwanie przygotowane przez mistrza otwierania zamk�w.
	AI_Output (self, other, "DIA_Jesper_Tuer_09_02");//Umie�ci� na niej tak skomplikowany zamek, �e do tej pory nikt nie m�g� go otworzy�.
	AI_Output (self, other, "DIA_Jesper_Tuer_09_03");//Niestety, zosta� z�apany - wyrzucili go za Barier� i pewnie tam umar�.
	AI_Output (self, other, "DIA_Jesper_Tuer_09_04");//Je�li jednak chcesz otworzy� skrzyni�, to we� ten klucz od drzwi sali.
	
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
	description = "Uda�o mi si� otworzy� skrzyni�.";
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
	AI_Output (other, self, "DIA_Jesper_Truhe_15_00");//Uda�o mi si� otworzy� skrzyni�.
	AI_Output (self, other, "DIA_Jesper_Truhe_09_01");//Niemo�liwe! Wygl�da na to, �e mamy nowego mistrza otwierania zamk�w.
	AI_Output (self, other, "DIA_Jesper_Truhe_09_02");//Gratulacje!
	
	B_GivePlayerXP (XP_JesperTruhe);
};  


