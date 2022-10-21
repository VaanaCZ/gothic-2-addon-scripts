// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Bill_EXIT(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 999;
	condition	= DIA_Addon_Bill_EXIT_Condition;
	information	= DIA_Addon_Bill_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Bill_EXIT_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Bill_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Bill_PICKPOCKET (C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 900;
	condition	= DIA_Addon_Bill_PICKPOCKET_Condition;
	information	= DIA_Addon_Bill_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Addon_Bill_PICKPOCKET_Condition()
{
	C_Beklauen (80, 205);
};
 
FUNC VOID DIA_Addon_Bill_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Bill_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Bill_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Bill_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Bill_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Bill_PICKPOCKET_DoIt);
};

func void DIA_Addon_Bill_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Bill_PICKPOCKET);
};
	
func void DIA_Addon_Bill_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Bill_PICKPOCKET);
};
// ************************************************************
// 			  				   Hello
// ************************************************************
INSTANCE DIA_Addon_Bill_Hello(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 1;
	condition	= DIA_Addon_Bill_Hello_Condition;
	information	= DIA_Addon_Bill_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Bill_Hello_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Bill_Hello_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bill_Hello_15_00"); //Wszystko w porz�dku?
	AI_Output (self ,other,"DIA_Addon_Bill_Hello_03_01"); //Co si� dzieje? Henry ci� tu przys�a�?
	AI_Output (self ,other,"DIA_Addon_Bill_Hello_03_02"); //Powiedz mu, �e nied�ugo dostanie swoje deski.
	AI_Output (self ,other,"DIA_Addon_Bill_Hello_03_03"); //Je�li go to nie urz�dza, to niech sam je sobie pi�uje.
	
	Npc_ExchangeRoutine (self, "START");
};

// ************************************************************
// 			  				 Planks
// ************************************************************
INSTANCE DIA_Addon_Bill_Planks(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 2;
	condition	= DIA_Addon_Bill_Planks_Condition;
	information	= DIA_Addon_Bill_Planks_Info;

	description = "Co robisz z tymi deskami?";
};                       
FUNC INT DIA_Addon_Bill_Planks_Condition()
{
	if (GregIsBAck == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Addon_Bill_Planks_Info()
{	
	AI_Output (other, self, "DIA_Addon_Bill_Planks_15_00"); //Co robisz z tymi deskami?
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_01"); //A jak s�dzisz? S� potrzebne do budowy palisady, o�le!
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_02"); //Greg uzna�, �e warto lepiej ufortyfikowa� nasz ob�z.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_03"); //Ale uwa�am, �e nie ma to wi�kszego sensu.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_04"); //Je�li bandyci nas zaatakuj�, to ta �mieszna palisada ich nie zatrzyma.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_05"); //Powinni�my byli pozby� si� ich dawno temu.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_06"); //Gdybym wiedzia�, co tu si� b�dzie dzia�o, zosta�bym w Khorinis.
};
	
// ************************************************************
// 							PERM
// ************************************************************
var int Bill_Perm_Once;

instance DIA_Addon_Bill_Perm		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 4;
	condition	= DIA_Addon_Bill_Perm_Condition;
	information	= DIA_Addon_Bill_Perm_Info;
	permanent	= TRUE;
	description	= "Mog� ci pom�c w pi�owaniu?";
};
func int DIA_Addon_Bill_Perm_Condition ()
{
	if (GregIsBack == FALSE)
	&& (Npc_WasInState (self, ZS_Saw))
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_Perm_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bill_Perm_15_00"); //Mog� ci pom�c w pi�owaniu?
	AI_Output	(self, other, "DIA_Addon_Bill_Perm_03_01"); //Nie trzeba, dam sobie rad�.
	if (Bill_Perm_Once == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Bill_Perm_03_02"); //Niedawno przy��czy�em si� do obozu i je�li pozwol�, �eby inni za mnie pracowali, b�d� mieli mnie za lenia, rozumiesz?
		Bill_Perm_Once = TRUE;
	};
};

// ************************************************************
//							PERM 2
// ************************************************************
instance DIA_Addon_Bill_Perm2		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 5;
	condition	= DIA_Addon_Bill_Perm2_Condition;
	information	= DIA_Addon_Bill_Perm2_Info;
	permanent	= TRUE;
	description	= "Co teraz b�dziesz robi�?";
};
func int DIA_Addon_Bill_Perm2_Condition ()
{
	if (GregIsBack == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_Perm2_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bill_Perm2_15_00"); //Co teraz b�dziesz robi�?
	AI_Output	(self, other, "DIA_Addon_Bill_Perm2_03_01"); //Musz� chwil� odpocz��.
	if (!Npc_IsDead(Francis))
	{
		AI_Output	(self, other, "DIA_Addon_Bill_Perm2_03_02"); //Francis zajmuje si� moj� dawn� robot�.
		AI_Output	(self, other, "DIA_Addon_Bill_Perm2_03_03"); //Je�li o mnie chodzi, to mo�e pi�owa� a� do ko�ca �wiata.
	};
};



// ************************************************************
// ***														***
// 					Die Angus und Hank Show
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 					Ich suche Angus und Hank.
// ------------------------------------------------------------
INSTANCE DIA_Addon_Bill_AngusnHank(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 11;
	condition	= DIA_Addon_Bill_AngusnHank_Condition;
	information	= DIA_Addon_Bill_AngusnHank_Info;
	permanent	= FALSE;
	description = "Szukam Angusa i Hanka.";
};                       
FUNC INT DIA_Addon_Bill_AngusnHank_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Skip_AngusHank))
	&&  Npc_HasItems (Angus, ItRi_Addon_MorgansRing_Mission)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Bill_AngusnHank_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bill_AngusnHank_15_00"); //Szukam Angusa i Hanka.
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_01"); //Nie mam poj�cia, gdzie teraz s� - mo�e dopadli ich bandyci?
	AI_Output (other,self ,"DIA_Addon_Bill_AngusnHank_15_02"); //Byli�cie przyjaci�mi, prawda?
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_03"); //Wiem tylko, �e chcieli spotka� si� z bandytami w jednej z pobliskich jaski�.
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_04"); //Pewnie gdzie� na wsch�d od obozu. 
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_05"); //Ale nie wiem dok�adnie gdzie. Nigdy tam nie by�em.
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_06"); //Najlepiej b�dzie, je�li zapytasz o to Jacka Aligatora. On wie wszystko o okolicy.

	B_LogEntry	(TOPIC_Addon_SkipsGrog,"Angus i Hank siedzieli w jaskini na wsch�d od obozu. Jack Aligator mo�e wiedzie� wi�cej na ten temat.");
};

// ------------------------------------------------------------
// 							Sie sind tot.
// ------------------------------------------------------------
INSTANCE DIA_Addon_Bill_FoundFriends(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 12;
	condition	= DIA_Addon_Bill_FoundFriends_Condition;
	information	= DIA_Addon_Bill_FoundFriends_Info;
	permanent	= FALSE;
	description = "Znalaz�em twoich przyjaci�.";
};                       
FUNC INT DIA_Addon_Bill_FoundFriends_Condition()
{
	if (!Npc_HasItems (Angus, ItRi_Addon_MorgansRing_Mission))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Bill_FoundFriends_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bill_FoundFriends_15_00"); //Znalaz�em twoich przyjaci�.
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_01"); //No i? Gdzie s�?
	AI_Output (other,self ,"DIA_Addon_Bill_FoundFriends_15_02"); //Nie �yj�.
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_03"); //To sprawka tych cholernych bandyt�w!
	if (SC_Knows_JuanMurderedAngus == FALSE)
	{
		AI_Output (other,self ,"DIA_Addon_Bill_FoundFriends_15_06"); //By� mo�e.
	};
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_04"); //Przekl�te �otry! Niech ich piek�o poch�onie!
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_05"); //Du�o bym da�, �eby dowiedzie� si�, kto jest temu winien...
	
	MIS_Addon_Bill_SearchAngusMurder = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_KillJuan,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_KillJuan,LOG_RUNNING);
	B_LogEntry	(TOPIC_Addon_KillJuan,"Bill by� w�ciek�y, kiedy powiedzia�em mu o �mierci Angusa i Hanka. Chce zna� imi� mordercy.");
};	

// ------------------------------------------------------------
// 						Ich kenne den M�rder
// ------------------------------------------------------------
instance DIA_Addon_Bill_JuanMurder		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 13;
	condition	= DIA_Addon_Bill_JuanMurder_Condition;
	information	= DIA_Addon_Bill_JuanMurder_Info;

	description	= "Wiem, kto zamordowa� Angusa i Hanka.";
};
func int DIA_Addon_Bill_JuanMurder_Condition ()
{
	if (MIS_Addon_Bill_SearchAngusMurder == LOG_RUNNING)
	&& (SC_Knows_JuanMurderedAngus == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_JuanMurder_Info ()
{
	AI_Output (other, self, "DIA_Addon_Bill_JuanMurder_15_00"); //Wiem, kto zamordowa� Angusa i Hanka.
	AI_Output (self, other, "DIA_Addon_Bill_JuanMurder_03_01"); //Kto? M�w, kto to zrobi�!
	AI_Output (other, self, "DIA_Addon_Bill_JuanMurder_15_02"); //To jeden z bandyt�w - Juan.
	AI_Output (self, other, "DIA_Addon_Bill_JuanMurder_03_03"); //Musisz si� go pozby�, rozumiesz?
	AI_Output (self, other, "DIA_Addon_Bill_JuanMurder_03_04"); //Ta zbrodnia nie mo�e uj�� mu p�azem!
	
	B_LogEntry	(TOPIC_Addon_KillJuan,"Mam zabi� Juana, �eby pom�ci� Angusa i Hanka.");
};

// ------------------------------------------------------------
// 						Juan ist erledigt.
// ------------------------------------------------------------
INSTANCE DIA_Addon_Bill_KilledEsteban(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 14;
	condition	= DIA_Addon_Bill_KilledEsteban_Condition;
	information	= DIA_Addon_Bill_KilledEsteban_Info;

	description = "Juan ju� nie b�dzie sprawia� k�opot�w.";
};                       
FUNC INT DIA_Addon_Bill_KilledEsteban_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Bill_JuanMurder))
	&& (Npc_IsDead (Juan))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Bill_KilledEsteban_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bill_KilledEsteban_15_00"); //Juan ju� nie b�dzie sprawia� k�opot�w.
	AI_Output (self ,other,"DIA_Addon_Bill_KilledEsteban_03_01"); //M�w, jak to si� sta�o? Bardzo cierpia�?
	AI_Output (other,self ,"DIA_Addon_Bill_KilledEsteban_15_02"); //Lepiej o tym nie m�wmy.
	AI_Output (self ,other,"DIA_Addon_Bill_KilledEsteban_03_03"); //W sumie racja. Wa�ne, �e ta �winia niczego ju� nie zrobi.
	
	B_LogEntry	(TOPIC_Addon_KillJuan,"Juan zosta� za�atwiony, co ucieszy�o Billa.");
	MIS_Addon_Bill_SearchAngusMurder = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Bill_KillAngusMurder);
	
};



// ************************************************************
// ***														***
//							Pick Pocket
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 							Khorinis?
// ------------------------------------------------------------
instance DIA_Addon_Bill_Khorinis		(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr		 	= 21;
	condition	= DIA_Addon_Bill_Khorinis_Condition;
	information	= DIA_Addon_Bill_Khorinis_Info;

	description	= "By�e� w Khorinis?";
};
func int DIA_Addon_Bill_Khorinis_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Bill_Planks))
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_Khorinis_Info ()
{
	AI_Output (other, self, "DIA_Addon_Bill_Khorinis_15_00"); //By�e� w Khorinis?
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_01"); //Tak. Troch� tam si� kr�ci�em, podcinaj�c sakiewki i zajmuj�c si� drobnym szwindlem.
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_02"); //Ale im mniej statk�w zawija�o do portu, tym gorzej szed� interes.
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_03"); //Zabawa ze stra�� przesta�a si� op�aca�.
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_04"); //I tak do��czy�em do Grega, a teraz siedz� tutaj.

	if (GregIsBAck == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_05"); //Ca�y dzie� pi�uj� drewno na palisad�, kt�ra i tak jest bezu�yteczna.
	};
};

// ------------------------------------------------------------
// 							Wanna Learn
// ------------------------------------------------------------
instance DIA_Addon_Bill_TeachPlayer		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 22;
	condition	= DIA_Addon_Bill_TeachPlayer_Condition;
	information	= DIA_Addon_Bill_TeachPlayer_Info;
	
	description	= "Mo�esz mnie czego� nauczy�?";
};
func int DIA_Addon_Bill_TeachPlayer_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Bill_Khorinis))
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_TeachPlayer_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bill_TeachPlayer_15_00"); //Mo�esz mnie czego� nauczy�?
	AI_Output	(self, other, "DIA_Addon_Bill_TeachPlayer_03_01"); //Mog� ci pokaza�, jak opr�nia� ludziom kieszenie tak, aby tego nie zauwa�yli.
	AI_Output	(self, other, "DIA_Addon_Bill_TeachPlayer_03_02"); //Ale musisz by� co najmniej �rednio zr�czny, bo inaczej nie ma sensu zaczyna� nauki.

	Bill_Addon_TeachPickPocket = TRUE;
};

// ------------------------------------------------------------
// 						Teach Pickpocket
// ------------------------------------------------------------
instance DIA_Addon_Bill_LearnTalent		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 23;
	condition	= DIA_Addon_Bill_LearnTalent_Condition;
	information	= DIA_Addon_Bill_LearnTalent_Info;
	permanent 	= TRUE;
	description	= "Poka� mi, jak okrada� innych. (10 PN)";
};
func int DIA_Addon_Bill_LearnTalent_Condition ()
{
	if (Bill_Addon_TeachPickPocket == TRUE)
	&& (Npc_GetTalentSkill (other, NPC_TALENT_PICKPOCKET) == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_LearnTalent_Info ()
{
	AI_Output (other, self, "DIA_Addon_Bill_LearnTalent_15_00"); //Poka� mi, jak okrada� innych.
	
	if (other.attribute[ATR_DEXTERITY] >= 40) //braucht man f�r Francis
	{
		if (B_TeachThiefTalent (self, other, NPC_TALENT_PICKPOCKET))
		{
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_01"); //Je�li chcesz kogo� okra��, musisz sprawi�, by poczu� si� bezpiecznie.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_02"); //Zawsze wci�gam ofiar� w pogaw�dk�. Dzia�a bez pud�a.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_03"); //Kiedy zabierasz si� za kradzie�, upewnij si�, �e ofiara niczego nie zauwa�y�a.

			AI_Output (other, self, "DIA_Addon_Bill_LearnTalent_15_05"); //Co� jeszcze?
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_06"); //Tak. Potrenuj troch� zr�czno��, jako �e zr�czniejszemu z�odziejowi �atwiej spostrzec dobr� okazj�.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_07"); //I �atwiej unikn�� z�apania na gor�cym uczynku.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_08"); //Przynajmniej w teorii.
		};
	}
	else 
	{
		AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_09"); //Zapomnij o tym. Jeste� zbyt niezdarny!
		AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_10"); //Potrenuj zr�czno�� albo znajd� sobie lepszego nauczyciela.
	};
};

