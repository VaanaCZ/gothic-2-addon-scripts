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
	AI_Output (other,self ,"DIA_Addon_Bill_Hello_15_00"); //Wszystko w porz¹dku?
	AI_Output (self ,other,"DIA_Addon_Bill_Hello_03_01"); //Co siê dzieje? Henry ciê tu przys³a³?
	AI_Output (self ,other,"DIA_Addon_Bill_Hello_03_02"); //Powiedz mu, ¿e nied³ugo dostanie swoje deski.
	AI_Output (self ,other,"DIA_Addon_Bill_Hello_03_03"); //Jeœli go to nie urz¹dza, to niech sam je sobie pi³uje.
	
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
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_01"); //A jak s¹dzisz? S¹ potrzebne do budowy palisady, oœle!
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_02"); //Greg uzna³, ¿e warto lepiej ufortyfikowaæ nasz obóz.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_03"); //Ale uwa¿am, ¿e nie ma to wiêkszego sensu.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_04"); //Jeœli bandyci nas zaatakuj¹, to ta œmieszna palisada ich nie zatrzyma.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_05"); //Powinniœmy byli pozbyæ siê ich dawno temu.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_06"); //Gdybym wiedzia³, co tu siê bêdzie dzia³o, zosta³bym w Khorinis.
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
	description	= "Mogê ci pomóc w pi³owaniu?";
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
	AI_Output	(other, self, "DIA_Addon_Bill_Perm_15_00"); //Mogê ci pomóc w pi³owaniu?
	AI_Output	(self, other, "DIA_Addon_Bill_Perm_03_01"); //Nie trzeba, dam sobie radê.
	if (Bill_Perm_Once == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Bill_Perm_03_02"); //Niedawno przy³¹czy³em siê do obozu i jeœli pozwolê, ¿eby inni za mnie pracowali, bêd¹ mieli mnie za lenia, rozumiesz?
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
	description	= "Co teraz bêdziesz robiæ?";
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
	AI_Output	(other, self, "DIA_Addon_Bill_Perm2_15_00"); //Co teraz bêdziesz robiæ?
	AI_Output	(self, other, "DIA_Addon_Bill_Perm2_03_01"); //Muszê chwilê odpocz¹æ.
	if (!Npc_IsDead(Francis))
	{
		AI_Output	(self, other, "DIA_Addon_Bill_Perm2_03_02"); //Francis zajmuje siê moj¹ dawn¹ robot¹.
		AI_Output	(self, other, "DIA_Addon_Bill_Perm2_03_03"); //Jeœli o mnie chodzi, to mo¿e pi³owaæ a¿ do koñca œwiata.
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
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_01"); //Nie mam pojêcia, gdzie teraz s¹ - mo¿e dopadli ich bandyci?
	AI_Output (other,self ,"DIA_Addon_Bill_AngusnHank_15_02"); //Byliœcie przyjació³mi, prawda?
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_03"); //Wiem tylko, ¿e chcieli spotkaæ siê z bandytami w jednej z pobliskich jaskiñ.
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_04"); //Pewnie gdzieœ na wschód od obozu. 
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_05"); //Ale nie wiem dok³adnie gdzie. Nigdy tam nie by³em.
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_06"); //Najlepiej bêdzie, jeœli zapytasz o to Jacka Aligatora. On wie wszystko o okolicy.

	B_LogEntry	(TOPIC_Addon_SkipsGrog,"Angus i Hank siedzieli w jaskini na wschód od obozu. Jack Aligator mo¿e wiedzieæ wiêcej na ten temat.");
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
	description = "Znalaz³em twoich przyjació³.";
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
	AI_Output (other,self ,"DIA_Addon_Bill_FoundFriends_15_00"); //Znalaz³em twoich przyjació³.
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_01"); //No i? Gdzie s¹?
	AI_Output (other,self ,"DIA_Addon_Bill_FoundFriends_15_02"); //Nie ¿yj¹.
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_03"); //To sprawka tych cholernych bandytów!
	if (SC_Knows_JuanMurderedAngus == FALSE)
	{
		AI_Output (other,self ,"DIA_Addon_Bill_FoundFriends_15_06"); //Byæ mo¿e.
	};
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_04"); //Przeklête ³otry! Niech ich piek³o poch³onie!
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_05"); //Du¿o bym da³, ¿eby dowiedzieæ siê, kto jest temu winien...
	
	MIS_Addon_Bill_SearchAngusMurder = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_KillJuan,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_KillJuan,LOG_RUNNING);
	B_LogEntry	(TOPIC_Addon_KillJuan,"Bill by³ wœciek³y, kiedy powiedzia³em mu o œmierci Angusa i Hanka. Chce znaæ imiê mordercy.");
};	

// ------------------------------------------------------------
// 						Ich kenne den Mörder
// ------------------------------------------------------------
instance DIA_Addon_Bill_JuanMurder		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 13;
	condition	= DIA_Addon_Bill_JuanMurder_Condition;
	information	= DIA_Addon_Bill_JuanMurder_Info;

	description	= "Wiem, kto zamordowa³ Angusa i Hanka.";
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
	AI_Output (other, self, "DIA_Addon_Bill_JuanMurder_15_00"); //Wiem, kto zamordowa³ Angusa i Hanka.
	AI_Output (self, other, "DIA_Addon_Bill_JuanMurder_03_01"); //Kto? Mów, kto to zrobi³!
	AI_Output (other, self, "DIA_Addon_Bill_JuanMurder_15_02"); //To jeden z bandytów - Juan.
	AI_Output (self, other, "DIA_Addon_Bill_JuanMurder_03_03"); //Musisz siê go pozbyæ, rozumiesz?
	AI_Output (self, other, "DIA_Addon_Bill_JuanMurder_03_04"); //Ta zbrodnia nie mo¿e ujœæ mu p³azem!
	
	B_LogEntry	(TOPIC_Addon_KillJuan,"Mam zabiæ Juana, ¿eby pomœciæ Angusa i Hanka.");
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

	description = "Juan ju¿ nie bêdzie sprawia³ k³opotów.";
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
	AI_Output (other,self ,"DIA_Addon_Bill_KilledEsteban_15_00"); //Juan ju¿ nie bêdzie sprawia³ k³opotów.
	AI_Output (self ,other,"DIA_Addon_Bill_KilledEsteban_03_01"); //Mów, jak to siê sta³o? Bardzo cierpia³?
	AI_Output (other,self ,"DIA_Addon_Bill_KilledEsteban_15_02"); //Lepiej o tym nie mówmy.
	AI_Output (self ,other,"DIA_Addon_Bill_KilledEsteban_03_03"); //W sumie racja. Wa¿ne, ¿e ta œwinia niczego ju¿ nie zrobi.
	
	B_LogEntry	(TOPIC_Addon_KillJuan,"Juan zosta³ za³atwiony, co ucieszy³o Billa.");
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

	description	= "By³eœ w Khorinis?";
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
	AI_Output (other, self, "DIA_Addon_Bill_Khorinis_15_00"); //By³eœ w Khorinis?
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_01"); //Tak. Trochê tam siê krêci³em, podcinaj¹c sakiewki i zajmuj¹c siê drobnym szwindlem.
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_02"); //Ale im mniej statków zawija³o do portu, tym gorzej szed³ interes.
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_03"); //Zabawa ze stra¿¹ przesta³a siê op³acaæ.
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_04"); //I tak do³¹czy³em do Grega, a teraz siedzê tutaj.

	if (GregIsBAck == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_05"); //Ca³y dzieñ pi³ujê drewno na palisadê, która i tak jest bezu¿yteczna.
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
	
	description	= "Mo¿esz mnie czegoœ nauczyæ?";
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
	AI_Output	(other, self, "DIA_Addon_Bill_TeachPlayer_15_00"); //Mo¿esz mnie czegoœ nauczyæ?
	AI_Output	(self, other, "DIA_Addon_Bill_TeachPlayer_03_01"); //Mogê ci pokazaæ, jak opró¿niaæ ludziom kieszenie tak, aby tego nie zauwa¿yli.
	AI_Output	(self, other, "DIA_Addon_Bill_TeachPlayer_03_02"); //Ale musisz byæ co najmniej œrednio zrêczny, bo inaczej nie ma sensu zaczynaæ nauki.

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
	description	= "Poka¿ mi, jak okradaæ innych. (10 PN)";
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
	AI_Output (other, self, "DIA_Addon_Bill_LearnTalent_15_00"); //Poka¿ mi, jak okradaæ innych.
	
	if (other.attribute[ATR_DEXTERITY] >= 40) //braucht man für Francis
	{
		if (B_TeachThiefTalent (self, other, NPC_TALENT_PICKPOCKET))
		{
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_01"); //Jeœli chcesz kogoœ okraœæ, musisz sprawiæ, by poczu³ siê bezpiecznie.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_02"); //Zawsze wci¹gam ofiarê w pogawêdkê. Dzia³a bez pud³a.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_03"); //Kiedy zabierasz siê za kradzie¿, upewnij siê, ¿e ofiara niczego nie zauwa¿y³a.

			AI_Output (other, self, "DIA_Addon_Bill_LearnTalent_15_05"); //Coœ jeszcze?
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_06"); //Tak. Potrenuj trochê zrêcznoœæ, jako ¿e zrêczniejszemu z³odziejowi ³atwiej spostrzec dobr¹ okazjê.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_07"); //I ³atwiej unikn¹æ z³apania na gor¹cym uczynku.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_08"); //Przynajmniej w teorii.
		};
	}
	else 
	{
		AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_09"); //Zapomnij o tym. Jesteœ zbyt niezdarny!
		AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_10"); //Potrenuj zrêcznoœæ albo znajdŸ sobie lepszego nauczyciela.
	};
};

