// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Greg_EXIT(C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 999;
	condition	= DIA_Addon_Greg_EXIT_Condition;
	information	= DIA_Addon_Greg_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Greg_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Greg_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Greg_PICKPOCKET (C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 900;
	condition	= DIA_Addon_Greg_PICKPOCKET_Condition;
	information	= DIA_Addon_Greg_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_120;
};                       

FUNC INT DIA_Addon_Greg_PICKPOCKET_Condition()
{
	C_Beklauen (111, 666);
};
 
FUNC VOID DIA_Addon_Greg_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Greg_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Greg_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Greg_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Greg_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Greg_PICKPOCKET_DoIt);
};

func void DIA_Addon_Greg_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Greg_PICKPOCKET);
};
	
func void DIA_Addon_Greg_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Greg_PICKPOCKET);
};
// ************************************************************
// 			  			Hallo - (Greg Is Back)
// ************************************************************
INSTANCE DIA_Addon_Greg_ImNew(C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 1;
	condition	= DIA_Addon_Greg_ImNew_Condition;
	information	= DIA_Addon_Greg_ImNew_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Greg_ImNew_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Greg_ImNew_Info()
{	
	AI_Output (self,other,"DIA_Addon_Greg_Hello_01_00"); //Ej, ty! Co robisz w mojej chacie?
	AI_Output (other,self,"DIA_Addon_Greg_Hello_15_01"); //Ja...
	AI_Output (self,other,"DIA_Addon_Greg_Hello_01_02"); //Nie ma mnie parê dni, a ka¿dy myœli, ¿e mo¿e robiæ, co mu siê ¿ywnie podoba?
	//AI_Output (other,self,"DIA_Addon_Greg_ImNew_15_00"); //Ich bin der Neue.
	//AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_01"); //(zynisch) So so, du bist der Neue.
	//AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_02"); //Hier entscheide immer noch ICH, wer bei uns mitmacht.
	AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_03"); //Dobrze, ale co tu siê dzieje?
	AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_04"); //A co, palisada jest skoñczona? A mo¿e w kanionie nie roi siê ju¿ od potworów? Wszyscy maj¹ to gdzieœ i le¿¹ brzuchem do góry!
		
	GregIsBack = TRUE;
	
	if (!Npc_IsDead (Francis))
	{
		AI_TurnToNpc (self, Francis);
		AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_05"); //To wszystko, co uda³o ci siê zrobiæ, Francis?
		
		if (C_BodyStateContains (Francis, BS_SIT))
		{
			AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_06"); //Z³aŸ z mojej ³awki! I to ju¿!
		};
	};
	
	Npc_ExchangeRoutine	(self,"HOME");
	AI_TurnToNpc (self, other);
	AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_07"); //A ty? Co takiego zrobi³eœ?
	
	Info_ClearChoices	(DIA_Addon_Greg_ImNew);
	Info_AddChoice	(DIA_Addon_Greg_ImNew, "Nie by³o tego zbyt wiele.", DIA_Addon_Greg_ImNew_nich );
	if (
			(Npc_IsDead(BeachLurker1))
			&& (Npc_IsDead(BeachLurker2))
			&& (Npc_IsDead(BeachLurker3))
			&& (Npc_IsDead(BeachWaran1))
			&& (Npc_IsDead(BeachWaran2))
			&& (Npc_IsDead(BeachShadowbeast1))
			&& (Npc_IsDead(BeachShadowbeast1))
			&& (MIS_Addon_MorganLurker != 0 )
		)
		|| (C_TowerBanditsDead() == TRUE)
			{
				Info_AddChoice	(DIA_Addon_Greg_ImNew, "Pracowa³em.", DIA_Addon_Greg_ImNew_turm );
			};

	};
// ------------------------------------------------------------------
func void B_UseRakeBilanz ()
{
	if (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (Greg_SuchWeiter == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_00"); //Nie myœl, ¿e zapomnê o tym, co jesteœ mi winien!
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_01"); //Na ca³ej wyspie zakopa³em rzeczy warte parê setek sztuk z³ota.
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_02"); //A ty oczywiœcie wszystko sobie przyw³aszczy³eœ, co?
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_03"); //Bêdziesz musia³ odpracowaæ swój d³ug.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_04"); //Teraz poznasz prawdziwe znaczenie s³owa "praca".
	};
	
	if (!Npc_IsDead (Francis))
	{
		Npc_ExchangeRoutine  (Francis,"GREGISBACK");
		AI_StartState (Francis, ZS_Saw, 1, "ADW_PIRATECAMP_BEACH_19"); //HACK - REDUNDANT!!!
		Francis_ausgeschissen = TRUE;
	};
	
	Info_ClearChoices	(DIA_Addon_Greg_ImNew);
};
// --------------------------------------------------------------------
func void DIA_Addon_Greg_ImNew_nich ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_ImNew_nich_15_00"); //Nie by³o tego zbyt wiele.
	AI_Output			(self, other, "DIA_Addon_Greg_ImNew_nich_01_01"); //Niewa¿ne. Nied³ugo ci coœ wynajdê, ch³opcze.
	B_UseRakeBilanz ();
};
func void DIA_Addon_Greg_ImNew_turm ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_ImNew_turm_15_00"); //Pracowa³em.
	AI_Output			(self, other, "DIA_Addon_Greg_ImNew_turm_01_01"); //Co takiego?

	if (C_TowerBanditsDead() == TRUE)
	{
		AI_Output			(other, self, "DIA_Addon_Greg_ImNew_turm_15_02"); //Pozby³em siê bandytów z wie¿y.
	};

	if (Npc_IsDead(BeachLurker1))
	&& (Npc_IsDead(BeachLurker2))
	&& (Npc_IsDead(BeachLurker3))
	&& (Npc_IsDead(BeachWaran1))
	&& (Npc_IsDead(BeachWaran2))
	&& (Npc_IsDead(BeachShadowbeast1))
	&& (MIS_Addon_MorganLurker != 0)
	{
		AI_Output			(other, self, "DIA_Addon_Greg_ImNew_turm_15_03"); //Pla¿a na pó³nocy jest ju¿ bezpieczna.
	};

	AI_Output			(self, other, "DIA_Addon_Greg_ImNew_turm_01_04"); //Dobrze. Ale to i tak dopiero pocz¹tek.
	
	B_UseRakeBilanz ();
};

// ************************************************************
// 			  				JoinPirates
// ************************************************************
INSTANCE DIA_Addon_Greg_JoinPirates(C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 5;
	condition	= DIA_Addon_Greg_JoinPirates_Condition;
	information	= DIA_Addon_Greg_JoinPirates_Info;
	permanent	= FALSE;
	description = "Co mam zrobiæ?";
};                       
FUNC INT DIA_Addon_Greg_JoinPirates_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Greg_ImNew) == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Greg_JoinPirates_Info()
{	
	AI_Output (other,self,"DIA_Addon_Greg_JoinPirates_15_00"); //Co mam zrobiæ?
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_01_01"); //Najpierw musimy doprowadziæ to miejsce do porz¹dku.

	if ((Npc_IsDead(Morgan))== FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_01_02"); //Morgan, ten obibok, bêdzie pi³owa³ deski.
	};
	
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_01_03"); //A ty przejmiesz jego robotê i oczyœcisz kanion z tych cholernych stworów.
	
	MIS_Addon_Greg_ClearCanyon = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_ClearCanyon,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_ClearCanyon,LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_ClearCanyon,"Greg chce, ¿ebym przej¹³ robotê po Morganie i oczyœci³ kanion z potworów.");

	Info_ClearChoices (DIA_Addon_Greg_JoinPirates);
	Info_AddChoice (DIA_Addon_Greg_JoinPirates,"No to idê.",DIA_Addon_Greg_JoinPirates_Leave);

	if (((Npc_IsDead(Brandon))== FALSE)
	|| ((Npc_IsDead(Matt))== FALSE))
	{
		Info_AddChoice (DIA_Addon_Greg_JoinPirates,"Mam tam pójœæ sam?",DIA_Addon_Greg_JoinPirates_Compadres);
	};

	Info_AddChoice (DIA_Addon_Greg_JoinPirates,"O jakich stworach mówi³eœ?",DIA_Addon_Greg_JoinPirates_ClearCanyon);
};

FUNC VOID DIA_Addon_Greg_JoinPirates_Leave()
{
	AI_Output (other,self,"DIA_Addon_Greg_JoinPirates_Leave_15_00"); //No to idê.
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_01"); //Chwila. Od teraz jesteœ jednym z nas.
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_02"); //Za³ó¿ jakiœ porz¹dny strój, zanim ruszysz na polowanie.
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_03"); //To jeden z naszych pancerzy. Powinien pasowaæ na ciebie.
	CreateInvItems (self, ItAr_Pir_M_Addon, 1);									
	B_GiveInvItems (self, other, ItAr_Pir_M_Addon, 1);		
	AI_EquipArmor(hero,ItAr_Pir_M_Addon);
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_04"); //I nie oci¹gaj siê z robot¹.
	

	Info_ClearChoices (DIA_Addon_Greg_JoinPirates);
};

FUNC VOID DIA_Addon_Greg_JoinPirates_Compadres()
{
	AI_Output (other,self ,"DIA_Addon_Greg_JoinPirates_Compadres_15_00"); //Mam tam pójœæ sam?
	AI_Output (self ,other,"DIA_Addon_Greg_JoinPirates_Compadres_01_01"); //Mo¿esz wzi¹æ paru ch³opaków, jeœli chcesz.
	AI_Output (self ,other,"DIA_Addon_Greg_JoinPirates_Compadres_01_02"); //Powinni uczciwie popracowaæ, zamiast siê leniæ.

	B_LogEntry (TOPIC_Addon_ClearCanyon,"Greg powiedzia³, ¿e mogê wzi¹æ z sob¹ czêœæ ch³opaków.");
};

FUNC VOID DIA_Addon_Greg_JoinPirates_ClearCanyon()
{
	AI_Output (other,self ,"DIA_Addon_Greg_JoinPirates_ClearCanyon_15_00"); //O jakich stworach mówi³eœ?
	AI_Output (self ,other,"DIA_Addon_Greg_JoinPirates_ClearCanyon_01_01"); //O brzytwiakach. Co prawda siedz¹ w kanionie, ale czasami podchodz¹ pod nasz obóz.
	AI_Output (self ,other,"DIA_Addon_Greg_JoinPirates_ClearCanyon_01_02"); //Nie chcê, ¿eby któryœ z moich ludzi zosta³ po¿arty.

	B_LogEntry (TOPIC_Addon_ClearCanyon,"Œcigamy tylko brzytwiaki.");
};

// ************************************************************
// 			  				Wegen dem Canyon...
// ************************************************************
INSTANCE DIA_Addon_Greg_AboutCanyon(C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 5;
	condition	= DIA_Addon_Greg_AboutCanyon_Condition;
	information	= DIA_Addon_Greg_AboutCanyon_Info;
	permanent	= TRUE;
	description = "W sprawie kanionu...";
};                       
FUNC INT DIA_Addon_Greg_AboutCanyon_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Greg_AboutCanyon_Info()
{
	AI_Output (other,self ,"DIA_Addon_Greg_AboutCanyon_15_00"); //W sprawie kanionu...
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_01_01"); //Tak, o co chodzi?
	
	Info_ClearChoices (DIA_Addon_Greg_AboutCanyon);
	if (C_AllCanyonRazorDead() == FALSE)
	{
		Info_AddChoice (DIA_Addon_Greg_AboutCanyon,DIALOG_BACK,DIA_Addon_Greg_AboutCanyon_Back);	
		if (((Npc_IsDead(Brandon))== FALSE)
		|| ((Npc_IsDead(Matt))== FALSE))
		{
			Info_AddChoice (DIA_Addon_Greg_AboutCanyon,"Ktoœ mo¿e mi w tym pomóc?",DIA_Addon_Greg_AboutCanyon_Compadres);
		};
		Info_AddChoice (DIA_Addon_Greg_AboutCanyon,"Jakich stworów mam siê pozbyæ?",DIA_Addon_Greg_AboutCanyon_Job);
	}
	else 
	{
		Info_AddChoice (DIA_Addon_Greg_AboutCanyon,"Pozby³em siê wszystkich brzytwiaków.",DIA_Addon_Greg_AboutCanyon_RazorsDead);
	};
};

FUNC VOID DIA_Addon_Greg_AboutCanyon_Back()
{
	Info_ClearChoices (DIA_Addon_Greg_AboutCanyon);
};

FUNC VOID DIA_Addon_Greg_AboutCanyon_Compadres()
{
	AI_Output (other,self ,"DIA_Addon_Greg_AboutCanyon_Compadres_15_00"); //Ktoœ mo¿e mi w tym pomóc?
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_Compadres_01_01"); //WeŸ paru ch³opaków ze sob¹.
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_Compadres_01_02"); //I tak tylko siê obijaj¹.
	Info_ClearChoices (DIA_Addon_Greg_AboutCanyon);
};

FUNC VOID DIA_Addon_Greg_AboutCanyon_Job()
{
	AI_Output (other,self ,"DIA_Addon_Greg_AboutCanyon_Job_15_00"); //Jakich stworów mam siê pozbyæ?
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_Job_01_01"); //Przede wszystkim zabij brzytwiaki. Reszta mena¿erii jest stosunkowo bezpieczna.
	Info_ClearChoices (DIA_Addon_Greg_AboutCanyon);
};

FUNC VOID DIA_Addon_Greg_AboutCanyon_RazorsDead()
{
	AI_Output (other,self ,"DIA_Addon_Greg_AboutCanyon_RazorsDead_15_00"); //Pozby³em siê wszystkich brzytwiaków.
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_RazorsDead_01_01"); //Dobrze, bardzo dobrze... Widaæ, ¿e potrafisz to i owo.
	
	B_LogEntry (TOPIC_Addon_ClearCanyon,"Greg by³ prawie pod wra¿eniem, kiedy dowiedzia³ siê, ¿e zabi³em wszystkie brzytwiaki w kanionie.");
	
	MIS_Addon_Greg_ClearCanyon = LOG_SUCCESS;
	B_Addon_PiratesGoHome();
	B_GivePlayerXP (XP_ADDON_CLEARCANYON);
	Info_ClearChoices (DIA_Addon_Greg_AboutCanyon);
};


// ************************************************************
// 			  				BanditArmor
// ************************************************************
INSTANCE DIA_Addon_Greg_BanditArmor(C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 5;
	condition	= DIA_Addon_Greg_BanditArmor_Condition;
	information	= DIA_Addon_Greg_BanditArmor_Info;
	permanent	= TRUE;
	description = "Potrzebujê pancerza, jaki nosz¹ bandyci.";
};                       
FUNC INT DIA_Addon_Greg_BanditArmor_Condition()
{
	if (MIS_Greg_ScoutBandits == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Greg_BanditArmor_Info()
{	
	AI_Output (other,self,"DIA_Addon_Greg_BanditArmor_15_00"); //Potrzebujê pancerza, jaki nosz¹ bandyci.
	if (MIS_Addon_Greg_ClearCanyon != LOG_SUCCESS)
	{
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_01"); //Musisz na niego zas³u¿yæ. Poka¿, co potrafisz, to pogadamy.
		if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
		{
			AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_02"); //Najpierw za³atw wszystkie brzytwiaki.
		};
		
		B_LogEntry (TOPIC_Addon_BDTRuestung,"Greg chce, ¿ebym pomóg³ mu wprowadziæ trochê wigoru do obozu. Potem mo¿emy porozmawiaæ o zbroi."); 
	}
	else
	{
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_03"); //NieŸle ci idzie.
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_04"); //Chcia³em, ¿eby Bones za³o¿y³ bandycki pancerz i szpiegowa³ tych psubratów...
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_05"); //Ale s¹dzê, ¿e ty siê lepiej nadasz do takiej roboty.
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_06"); //Mo¿e nawet uda ci siê wyjœæ stamt¹d w jednym kawa³ku.
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_07"); //Pogadaj z Bonesem, to da ci pancerz. Na³ó¿ go i idŸ do obozu bandytów.
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_08"); //Chcia³bym wiedzieæ, po co te œwinie sprowadzi³y siê do doliny.
		AI_Output (other,self,"DIA_Addon_Greg_BanditArmor_15_09"); //Tak jest, kapitanie!
	
		B_LogEntry (TOPIC_Addon_BDTRuestung,"Po zabiciu wszystkich brzytwiaków w kanionie mogê odebraæ moj¹ zbrojê od Bonesa."); 
	
		Log_CreateTopic (TOPIC_Addon_ScoutBandits,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_Addon_ScoutBandits,LOG_RUNNING);
		B_LogEntry	(TOPIC_Addon_ScoutBandits,"Mam siê dowiedzieæ dla Grega, dlaczego w³aœciwie bandyci przybyli do doliny.");
	
		MIS_Greg_ScoutBandits = LOG_RUNNING;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Auftraege2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_Auftraege2		(C_INFO)
{
	npc		 = 	PIR_1320_Addon_Greg;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_Auftraege2_Condition;
	information	 = 	DIA_Addon_Greg_Auftraege2_Info;

	description	 = 	"Masz dla mnie jeszcze jakieœ zadanie?";
};

func int DIA_Addon_Greg_Auftraege2_Condition ()
{
	if (MIS_Greg_ScoutBandits != 0)
	&& (
		(C_TowerBanditsDead() == FALSE)
		|| (
				 (Npc_IsDead(BeachLurker1)== FALSE)
				&& (Npc_IsDead(BeachLurker2)== FALSE)
				&& (Npc_IsDead(BeachLurker3)== FALSE)
				&& (Npc_IsDead(BeachWaran1)== FALSE)
				&& (Npc_IsDead(BeachWaran2)== FALSE)
				&& (Npc_IsDead(BeachShadowbeast1)== FALSE)
		   )
		)
				{
					return TRUE;
				};
};

func void DIA_Addon_Greg_Auftraege2_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_Auftraege2_15_00"); //Masz dla mnie jeszcze jakieœ zadanie?

	if (Npc_IsDead(BeachLurker1)== FALSE)
	&& (Npc_IsDead(BeachLurker2)== FALSE)
	&& (Npc_IsDead(BeachLurker3)== FALSE)
	&& (Npc_IsDead(BeachWaran1)== FALSE)
	&& (Npc_IsDead(BeachWaran2)== FALSE)
	&& (Npc_IsDead(BeachShadowbeast1)== FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_01"); //Pla¿a na pó³nocy wci¹¿ jest pe³na stworów.
		AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_02"); //Morgan jak zwykle siê obija.
		
		Log_CreateTopic (TOPIC_Addon_MorganBeach,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_Addon_MorganBeach,LOG_RUNNING);
		B_LogEntry	(TOPIC_Addon_MorganBeach,"Greg chce, ¿ebym siê zaj¹³ pla¿¹. Pe³no na niej ró¿nych stworów i trzeba j¹ oczyœciæ.");
		
		MIS_Addon_MorganLurker = LOG_RUNNING;
	};
	
	if	(C_TowerBanditsDead() == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_03"); //W wie¿y stoj¹cej wœród po³udniowych klifów wci¹¿ gnie¿d¿¹ siê bandyci.
		AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_04"); //W sumie to Francis mia³ siê tym zaj¹æ.
	
		Log_CreateTopic (TOPIC_Addon_BanditsTower,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_Addon_BanditsTower,LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_BanditsTower,"Greg chce, ¿ebym przepêdzi³ bandytów z wie¿y na po³udnie od obozu.");
		
		MIS_Henry_FreeBDTTower = LOG_RUNNING; 
	
	};
	
	AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_05"); //Ale jeœli chcesz, to mo¿esz za³atwiæ i tê sprawê.
};

///////////////////////////////////////////////////////////////////////
//	Info Sauber2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_Sauber2		(C_INFO)
{
	npc		 = 	PIR_1320_Addon_Greg;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_Sauber2_Condition;
	information	 = 	DIA_Addon_Greg_Sauber2_Info;

	description	 = 	"Pó³nocna pla¿a jest ju¿ bezpieczna.";
};

func int DIA_Addon_Greg_Sauber2_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Greg_Auftraege2))
	&& (Npc_IsDead(BeachLurker1))
	&& (Npc_IsDead(BeachLurker2))
	&& (Npc_IsDead(BeachLurker3))
	&& (Npc_IsDead(BeachWaran1))
	&& (Npc_IsDead(BeachWaran2))
	&& (Npc_IsDead(BeachShadowbeast1))
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_Sauber2_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_Sauber2_15_00"); //Pó³nocna pla¿a jest ju¿ bezpieczna.
	AI_Output	(self, other, "DIA_Addon_Greg_Sauber2_01_01"); //Wspaniale. Oto twoja nagroda.
	CreateInvItems (self, ItMi_Gold, 200);									
	B_GiveInvItems (self, other, ItMi_Gold, 200);
	
	B_LogEntry	(TOPIC_Addon_MorganBeach,"Powiedzia³em Gregowi, ¿e oczyœci³em pó³nocn¹ pla¿ê.");
	
	MIS_Addon_MorganLurker = LOG_SUCCESS;	
	B_GivePlayerXP (XP_Addon_Morgan_LurkerPlatt);	
};

///////////////////////////////////////////////////////////////////////
//	Info BanditPlatt2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_BanditPlatt2		(C_INFO)
{
	npc		 = 	PIR_1320_Addon_Greg;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_BanditPlatt2_Condition;
	information	 = 	DIA_Addon_Greg_BanditPlatt2_Info;

	description	 = 	"Bandyci ju¿ nie wróc¹ do wie¿y.";
};

func int DIA_Addon_Greg_BanditPlatt2_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Greg_Auftraege2))
	&& (C_TowerBanditsDead() == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_BanditPlatt2_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_BanditPlatt2_15_00"); //Bandyci ju¿ nie wróc¹ do wie¿y.
	AI_Output	(self, other, "DIA_Addon_Greg_BanditPlatt2_01_01"); //Doskonale. Œwietnie siê spisa³eœ. Oto zap³ata za twój trud.
	CreateInvItems (self, ItMi_Gold, 200);									
	B_GiveInvItems (self, other, ItMi_Gold, 200);	
	
	B_LogEntry (TOPIC_Addon_BanditsTower,"Bandyci w wie¿y nie ¿yj¹. Greg jest bardzo zadowolony.");
	
	MIS_Henry_FreeBDTTower = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Henry_FreeBDTTower);	
};



// ************************************************************
// 			  				BanditGoldmine
// ************************************************************
INSTANCE DIA_Addon_Greg_BanditGoldmine(C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 5;
	condition	= DIA_Addon_Greg_BanditGoldmine_Condition;
	information	= DIA_Addon_Greg_BanditGoldmine_Info;
	permanent	= TRUE;
	description = "Bandyci odkryli kopalniê z³ota.";
};                       
FUNC INT DIA_Addon_Greg_BanditGoldmine_Condition()
{
	if (SC_KnowsRavensGoldmine == TRUE)
	&& (MIS_Greg_ScoutBandits == LOG_RUNNING)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Greg_BanditGoldmine_Info()
{	
	AI_Output (other,self,"DIA_Addon_Greg_BanditGoldmine_15_00"); //Bandyci odkryli kopalniê z³ota.
	AI_Output (self,other,"DIA_Addon_Greg_BanditGoldmine_01_01"); //Wiedzia³em! Dlatego tylu ich tu przylaz³o!
	AI_Output (self,other,"DIA_Addon_Greg_BanditGoldmine_01_02"); //Nikt nie mieszka³by wœród tych bagien roj¹cych siê od potworów, jeœli nie mia³by naprawdê solidnego powodu.
	AI_Output (self,other,"DIA_Addon_Greg_BanditGoldmine_01_03"); //Dobra robota. Tu jest coœ dla ciebie.
	
	B_GiveInvItems (self,other,ItRi_Addon_STR_01,1);
	
	B_LogEntry (TOPIC_Addon_ScoutBandits,"Poinformowa³em Grega o kopalni z³ota.");	
	
	MIS_Greg_ScoutBandits = LOG_SUCCESS;
	B_GivePlayerXP (XP_Greg_ScoutBandits);
};


// ************************************************************
// 			Wer bist du			  				
// ************************************************************
INSTANCE DIA_Addon_Greg_WhoAreYou(C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 2;
	condition	= DIA_Addon_Greg_WhoAreYou_Condition;
	information	= DIA_Addon_Greg_WhoAreYou_Info;
	permanent	= FALSE;
	description = "Kim jesteœ?";
};                       
FUNC INT DIA_Addon_Greg_WhoAreYou_Condition()
{
	if (PlayerTalkedToGregNW == FALSE)//Joly:WAR VOHER npc_gLOBAL -> GREG_NW
	&& (SC_MeetsGregTime == 0)//Joly:zur sicherheit
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Greg_WhoAreYou_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Greg_WhoAreYou_15_00"); //Kim jesteœ?
	AI_Output (self ,other,"DIA_Addon_Greg_WhoAreYou_01_01"); //Mam na imiê Greg i jestem przywódc¹ tej garstki ludzi.
	AI_Output (self ,other,"DIA_Addon_Greg_WhoAreYou_01_02"); //Zadowolony?
};

// ************************************************************
// 			  	NiceToSeeYou			
// ************************************************************
INSTANCE DIA_Addon_Greg_NiceToSeeYou(C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 5;
	condition	= DIA_Addon_Greg_NiceToSeeYou_Condition;
	information	= DIA_Addon_Greg_NiceToSeeYou_Info;
	permanent	= FALSE;
	description = "Jak siê tu dosta³eœ?";
};                       
FUNC INT DIA_Addon_Greg_NiceToSeeYou_Condition()
{
	if (PlayerTalkedToGregNW	 == TRUE)
	&& (MIS_Greg_ScoutBandits == 0)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Greg_NiceToSeeYou_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Greg_NiceToSeeYou_15_00"); //Jak siê tu dosta³eœ?
	AI_Output (self ,other,"DIA_Addon_Greg_NiceToSeeYou_01_01"); //Nie spodziewa³eœ siê mnie, co?
	AI_Output (self ,other,"DIA_Addon_Greg_NiceToSeeYou_01_02"); //¯eby nie by³o niedomówieñ - ja jestem Greg, a to jest mój obóz.
	AI_Output (self ,other,"DIA_Addon_Greg_NiceToSeeYou_01_03"); //Wszystko gra?
};
	
// ************************************************************
// 			  	Story			
// ************************************************************
INSTANCE DIA_Addon_Greg_Story(C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 99;
	condition	= DIA_Addon_Greg_Story_Condition;
	information	= DIA_Addon_Greg_Story_Info;
	permanent	= TRUE;
	description = "Interesuje mnie jeszcze jedna rzecz.";
};                       
FUNC INT DIA_Addon_Greg_Story_Condition()
{
	if ((Npc_KnowsInfo (other,DIA_Addon_Greg_WhoAreYou) == TRUE)
	|| (Npc_KnowsInfo (other,DIA_Addon_Greg_NiceToSeeYou) == TRUE))
	&& (MIS_Greg_ScoutBandits != 0)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Greg_Story_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Greg_Story_15_00"); //Interesuje mnie jeszcze jedna rzecz.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_01_01"); //Co znowu?
	
	Info_ClearChoices (DIA_Addon_Greg_Story);
	Info_AddChoice (DIA_Addon_Greg_Story,DIALOG_BACK,DIA_Addon_Greg_Story_Back);
	Info_AddChoice (DIA_Addon_Greg_Story,"Jak siê tu dosta³eœ?",DIA_Addon_Greg_Story_Way);
	Info_AddChoice (DIA_Addon_Greg_Story,"Gdzie jest twój statek?",DIA_Addon_Greg_Story_Ship);

	if (RavenIsDead == FALSE)
	{
		Info_AddChoice (DIA_Addon_Greg_Story,"Co wiesz o Kruku?",DIA_Addon_Greg_Story_Raven);
	};
};	

FUNC VOID DIA_Addon_Greg_Story_Back()
{
	Info_ClearChoices (DIA_Addon_Greg_Story);
};

FUNC VOID DIA_Addon_Greg_Story_Way()
{
	AI_Output (other,self ,"DIA_Addon_Greg_Story_Way_15_00"); //Jak siê tu dosta³eœ?
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_01"); //Uda³o mi siê znaleŸæ tunel. W starej piramidzie pilnowanej przez dwóch magów.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_02"); //Niby magowie, ale nawet nie zorientowali siê, ¿e tam by³em.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_03"); //Najpierw myœla³em, ¿e to grobowiec. Chcia³em sprawdziæ, czy nie ma w nim czegoœ wartoœciowego.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_04"); //I tak sobie szed³em, a¿ nagle znalaz³em siê w mojej ukochanej dolinie.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_05"); //A ju¿ myœla³em, ¿e przez resztê ¿ycia bêdê siê ukrywa³ przed stra¿¹.
};

FUNC VOID DIA_Addon_Greg_Story_Ship()
{
	AI_Output (other,self ,"DIA_Addon_Greg_Story_Ship_15_00"); //Gdzie jest twój statek?
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Ship_01_01"); //Nie uwierzysz. Od miesiêcy nie widzia³em w okolicy ¿adnego statku.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Ship_01_02"); //Od miesiêcy, wyobra¿asz sobie? I kiedy wreszcie jakiœ siê pojawi³, to królewski okrêt wojenny!
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Ship_01_03"); //Pe³en paladynów, od topu po kil.
	AI_Output (other,self ,"DIA_Addon_Greg_Story_Ship_15_04"); //Jeœli ju¿ mieæ pecha, to na ca³ego...
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Ship_01_05"); //£atwo ci mówiæ. Roznieœli nas w drzazgi jak pust¹ skrzyniê po owocach. Z ca³ej za³ogi tylko ja dotar³em ¿ywy do brzegu.
};
FUNC VOID DIA_Addon_Greg_Story_Raven()
{
	AI_Output (other,self ,"DIA_Addon_Greg_Story_Raven_15_00"); //Co wiesz o Kruku?
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Raven_01_01"); //Z tego, co mi wiadomo, by³ jednym z magnatów. Wielka szycha w Kolonii.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Raven_01_02"); //Nie mam pojêcia, co teraz porabia, ani czemu jego ludzie poszli za nim.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Raven_01_03"); //Ale wierz mi, na pewno coœ knuje. Nie nale¿y do tych, co zaszywaj¹ siê na bagnach i chc¹, ¿eby œwiat o nich zapomnia³.
};

///////////////////////////////////////////////////////////////////////
//	Info RavenDead
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_RavenDead		(C_INFO)
{
	npc		 = 	PIR_1320_Addon_Greg;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Greg_RavenDead_Condition;
	information	 = 	DIA_Addon_Greg_RavenDead_Info;

	description	 = 	"Kruk jest histori¹.";
};

func int DIA_Addon_Greg_RavenDead_Condition ()
{
	if (RavenIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_RavenDead_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_RavenDead_15_00"); //Kruk jest histori¹.
	AI_Output	(self, other, "DIA_Addon_Greg_RavenDead_01_01"); //Niech mnie diabli porw¹! Nie spodziewa³em siê tego. Musia³eœ go nieŸle zaskoczyæ!
	AI_Output	(self, other, "DIA_Addon_Greg_RavenDead_01_02"); //Oto 500 sztuk z³ota. Nale¿¹ ci siê.
	CreateInvItems (self, ItMi_Gold, 500);									
	B_GiveInvItems (self, other, ItMi_Gold, 500);		
	AI_Output	(self, other, "DIA_Addon_Greg_RavenDead_01_03"); //Masz charakter. Podobasz mi siê.
	B_GivePlayerXP (XP_ADDON_GregRavenLohn);
};



