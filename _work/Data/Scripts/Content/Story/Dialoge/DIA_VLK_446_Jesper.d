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
	AI_Output (self, other,"DIA_Jesper_Hallo_09_00");//Co tu robisz? Nie masz tu czego szukaæ.
	AI_Output (self, other,"DIA_Jesper_Hallo_09_01");//No dobra, co tu robisz?
		
	Info_ClearChoices (DIA_Jesper_Hallo);
	Info_AddChoice 	  (DIA_Jesper_Hallo,"Zamierzam ciê zabiæ.",DIA_Jesper_Hallo_Kill);	
	Info_AddChoice 	  (DIA_Jesper_Hallo,"Chcia³em trochê pozwiedzaæ.",DIA_Jesper_Hallo_NurSo);
		
	if  (Attila_Key == TRUE)
	{
		Info_AddChoice 	  (DIA_Jesper_Hallo,"Attila da³ mi klucz... ",DIA_Jesper_Hallo_Willkommen);
	}	
	else 
	{
		Info_AddChoice 	  (DIA_Jesper_Hallo,"Za³atwi³em Attilê...",DIA_Jesper_Hallo_Umgelegt);
	};
	
	DG_gefunden = TRUE;
	
};
FUNC VOID DIA_Jesper_Hallo_Kill()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_Kill_15_00");//Zamierzam ciê zabiæ.
	AI_Output (self, other,"DIA_Jesper_Hallo_Kill_09_01");//Có¿ za wspania³y pomys³. Sam na niego wpad³eœ, co? A co tam. Nie bêdê przed³u¿a³.
	
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Jesper_Hallo_NurSo()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_NurSo_15_00");//Chcia³em trochê pozwiedzaæ.
	AI_Output (self, other,"DIA_Jesper_Hallo_NurSo_09_01");//Nie ma siê na co gapiæ. Wkraczasz na grz¹ski grunt, jasne?
	AI_Output (self, other,"DIA_Jesper_Hallo_NurSo_09_02");//Wiêc nie ruszaj broni i powiedz mi, dlaczego tu jesteœ.
};
FUNC VOID DIA_Jesper_Hallo_Willkommen()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_Willkommen_15_00");//Attila da³ mi klucz. Dlatego tu jestem. Wiêc czego ode mnie chcesz?
	AI_Output (self, other,"DIA_Jesper_Hallo_Willkommen_09_01");//Chcia³byœ wiedzieæ? Spokojnie.
	AI_Output (self, other,"DIA_Jesper_Hallo_Willkommen_09_02");//IdŸ do Cassii. Czeka na ciebie.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");
};
FUNC VOID DIA_Jesper_Hallo_Umgelegt()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_Umgelegt_15_00");//Za³atwi³em Attilê. Mia³ przy sobie klucz do kana³ów.
	AI_Output (self, other,"DIA_Jesper_Hallo_Umgelegt_09_01");//Zabi³eœ Attilê? No i co z tego, to by³ nêdzny pies.
	AI_Output (self, other,"DIA_Jesper_Hallo_Umgelegt_09_02");//Powiem ci coœ. Jeœli mnie zaatakujesz, zabijê ciê.
	
	Info_ClearChoices (DIA_Jesper_Hallo);
	Info_AddChoice 	  (DIA_Jesper_Hallo,"Co ty tu robisz...",DIA_Jesper_Hallo_Was);	
	Info_AddChoice 	  (DIA_Jesper_Hallo,"Chcê siê zobaczyæ z twoim przywódc¹.",DIA_Jesper_Hallo_Anfuehrer);
};
FUNC VOID DIA_Jesper_Hallo_Was()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_Was_15_00");//Co robisz w tej ciemnej, wilgotnej norze?
	AI_Output (self, other,"DIA_Jesper_Hallo_Was_09_01");//Mieszkam tu. Jeszcze jedno g³upie pytanie, a wytnê ci na skórze wzorek.
};
FUNC VOID DIA_Jesper_Hallo_Anfuehrer()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_Anfuehrer_15_00");//Chcê siê zobaczyæ z twoim przywódc¹.
	AI_Output (self, other,"DIA_Jesper_Hallo_Anfuehrer_09_01");//HA - moim przywódc¹? Jestem pewien, ¿e Cassia chêtnie z tob¹ porozmawia.
	AI_Output (self, other,"DIA_Jesper_Hallo_Anfuehrer_09_02");//IdŸ - i nie próbuj ¿adnych sztuczek.
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
	description	= "Mo¿esz mnie czegoœ nauczyæ?";
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
	AI_Output (other, self, "DIA_Jesper_Bezahlen_15_00");//Mo¿esz mnie czegoœ nauczyæ?
	
	if (MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output (self, other, "DIA_Jesper_Bezahlen_09_01");//Pewnie, poka¿ê ci, jak siê skradaæ - za darmo.
		Jesper_TeachSneak = TRUE;
		Info_ClearChoices (DIA_Jesper_Bezahlen);
	}
	else
	{
		AI_Output (self, other, "DIA_Jesper_Bezahlen_09_02");//Chcesz siê nauczyæ, jak siê bezszelestnie poruszaæ? To ciê bêdzie kosztowaæ 100 sztuk z³ota.
		B_Say_Gold (self, other, Jesper_Cost);
		
		Info_ClearChoices (DIA_Jesper_Bezahlen);
		Info_AddChoice (DIA_Jesper_Bezahlen,"Mo¿e póŸniej... (POWRÓT)",DIA_Jesper_Bezahlen_Spaeter);
		Info_AddChoice (DIA_Jesper_Bezahlen,"Chcê siê nauczyæ sztuki skradania (zap³aæ 100 sztuk z³ota).",DIA_Jesper_Bezahlen_Okay);
	};
};
FUNC VOID DIA_Jesper_Bezahlen_Spaeter()
{
	Info_ClearChoices (DIA_Jesper_Bezahlen);
};
FUNC VOID DIA_Jesper_Bezahlen_Okay()
{
	AI_Output (other, self, "DIA_Jesper_Bezahlen_Okay_15_00");//Dobra, chcê siê nauczyæ skradania.
	
	if B_GiveInvItems (other, self, ItMi_Gold, 100)
	{
		AI_Output (other, self, "DIA_Jesper_Bezahlen_Okay_15_01");//Oto z³oto.
		AI_Output (self, other, "DIA_Jesper_Bezahlen_Okay_09_02");//Daj mi znaæ, jak bêdziesz gotowy.
		Jesper_TeachSneak = TRUE;
		Info_ClearChoices (DIA_Jesper_Bezahlen);
	}
	else 
	{
		AI_Output (self, other, "DIA_Jesper_Bezahlen_Okay_09_03");//Bez z³ota niczego siê nie nauczysz.
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
	description = "Naucz mnie zasad skradania i ukrywania siê.";
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
	AI_Output (other, self, "DIA_Jesper_Schleichen_15_00");//Naucz mnie sztuki skradania siê.
	
	if B_TeachThiefTalent (self, other, NPC_TALENT_SNEAK)
	{
		AI_Output (self, other, "DIA_Jesper_Schleichen_09_01");//Umiejêtnoœæ skradania siê jest niezwykle wa¿na dla ka¿dego z³odzieja. Przede wszystkim do poruszania siê po cudzych domach.
		AI_Output (self, other, "DIA_Jesper_Schleichen_09_02");//Nie tup tak. Wiêkszoœæ ludzi ma bardzo czujny sen.
		AI_Output (self, other, "DIA_Jesper_Schleichen_09_03");//Jeœli bêdziesz siê skrada³, nikt ciê nie us³yszy - wtedy bêdziesz móg³ pracowaæ bez przeszkód.
		DIA_Jesper_Schleichen_permanent = TRUE;
	};
};
//////////////////////////////////////////////////////////////////////
//	Info Freunde getötet
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
		AI_Output (self, other, "DIA_Jesper_Killer_09_00");//Zabi³eœ moich przyjació³. Dlaczego to zrobi³eœ, morderco?
		AI_Output (self, other, "DIA_Jesper_Killer_09_01");//Wyœlê ciê do królestwa Beliara.
	}
	else if Npc_IsDead (Cassia)
	{
		AI_Output (self, other, "DIA_Jesper_Killer_09_02");//Zabi³eœ Cassiê, ty parszywy morderco. Mnie jednak nie pokonasz!
		
		AI_StopProcessInfos (self);
		B_Attack (self, other, AR_NONE,1); 
	}
	else if  Npc_IsDead (Ramirez)
	{
		AI_Output (self, other, "DIA_Jesper_Killer_09_03");//Wyœwiadczy³em Ramirezowi wiêcej przys³ug i zebra³em wiêcej gotówki, ni¿ kiedykolwiek widzia³eœ.
		AI_Output (self, other, "DIA_Jesper_Killer_09_04");//A ty go zabi³eœ, wredny psie! Pora za to zap³aciæ!
		
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
	description = "Nie wiesz przypadkiem czegoœ o ³uku Bospera?";
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
	AI_Output (other, self, "DIA_Jesper_Bogen_15_00");//Nie wiesz przypadkiem czegoœ o ³uku Bospera?
	AI_Output (self, other, "DIA_Jesper_Bogen_09_01");//Chodzi ci o ten ³uk od ³uczarza? Taak, mam go gdzieœ w skrzyni.
	AI_Output (self, other, "DIA_Jesper_Bogen_09_02");//Pe³no tam jednak szczurów. Mo¿esz go przynieœæ, jeœli siê nie boisz.
	AI_Output (self, other, "DIA_Jesper_Bogen_09_03");//Och, oczywiœcie skrzynia jest zamkniêta. Bêdziesz musia³ siê w³amaæ. Na szczêœcie wci¹¿ masz wytrychy.
	
	Wld_InsertNpc (Giant_Rat, "NW_CITY_KANAL_ROOM_01_01");	
	Wld_InsertNpc (Giant_Rat, "NW_CITY_KANAL_ROOM_01_02");	
	Wld_InsertNpc (Giant_Rat, "NW_CITY_KANAL_ROOM_01_03");
};
//////////////////////////////////////////////////////////////////////
//	Info Tür
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_Tuer   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 10;
	condition   = DIA_Jesper_Tuer_Condition;
	information = DIA_Jesper_Tuer_Info;
	permanent   = FALSE;
	description = "Co jest za tymi zamkniêtymi drzwiami?";
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
	AI_Output (other, self, "DIA_Jesper_Tuer_15_00");//Co jest za tymi zamkniêtymi drzwiami?
	AI_Output (self, other, "DIA_Jesper_Tuer_09_01");//Dalej jest skrzynia - wyzwanie przygotowane przez mistrza otwierania zamków.
	AI_Output (self, other, "DIA_Jesper_Tuer_09_02");//Umieœci³ na niej tak skomplikowany zamek, ¿e do tej pory nikt nie móg³ go otworzyæ.
	AI_Output (self, other, "DIA_Jesper_Tuer_09_03");//Niestety, zosta³ z³apany - wyrzucili go za Barierê i pewnie tam umar³.
	AI_Output (self, other, "DIA_Jesper_Tuer_09_04");//Jeœli jednak chcesz otworzyæ skrzyniê, to weŸ ten klucz od drzwi sali.
	
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
	description = "Uda³o mi siê otworzyæ skrzyniê.";
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
	AI_Output (other, self, "DIA_Jesper_Truhe_15_00");//Uda³o mi siê otworzyæ skrzyniê.
	AI_Output (self, other, "DIA_Jesper_Truhe_09_01");//Niemo¿liwe! Wygl¹da na to, ¿e mamy nowego mistrza otwierania zamków.
	AI_Output (self, other, "DIA_Jesper_Truhe_09_02");//Gratulacje!
	
	B_GivePlayerXP (XP_JesperTruhe);
};  


