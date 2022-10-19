// ************************************************************
// 			  				   EXIT 
// ************************************************************
var int Morgan_Perm_Counter;
// ------------------------------------------------------------
INSTANCE DIA_Addon_Morgan_EXIT(C_INFO)
{
	npc			= PIR_1353_Addon_Morgan;
	nr			= 999;
	condition	= DIA_Addon_Morgan_EXIT_Condition;
	information	= DIA_Addon_Morgan_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Morgan_EXIT_Condition()
{
	return TRUE;
};
func int DIA_Addon_Morgan_EXIT_Info ()
{
	if (GregIsBack == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Morgan_Perm_15_00"); //Bêž se natáhnout.
		if (Morgan_Perm_Counter == 0)
		{
			AI_Output	(self, other, "DIA_Addon_Morgan_Perm_07_01"); //(zívá) Dobrej nápad.
			Morgan_Perm_Counter = 1;
		}
		else if (Morgan_Perm_Counter == 1)
		{
			AI_Output	(self, other, "DIA_Addon_Morgan_Perm_07_02"); //(ospale) Tak teda dobrou noc.
			Morgan_Perm_Counter = 2;
		}
		else if (Morgan_Perm_Counter == 2)
		{
			AI_Output	(self, other, "DIA_Addon_Morgan_Perm_07_03"); //(unavenê) S nejvêtší radostí.
			Morgan_Perm_Counter = 3;
		}
		else if (Morgan_Perm_Counter == 3)
		{
			AI_Output	(self, other, "DIA_Addon_Morgan_Perm_07_04"); //Kdyby nêco, tak mê vzbuë.
			Morgan_Perm_Counter = 0;
		};
	};
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Morgan_PICKPOCKET (C_INFO)
{
	npc			= PIR_1353_Addon_Morgan;
	nr			= 900;
	condition	= DIA_Addon_Morgan_PICKPOCKET_Condition;
	information	= DIA_Addon_Morgan_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Morgan_PICKPOCKET_Condition()
{
	C_Beklauen (20, 43);
};
 
FUNC VOID DIA_Addon_Morgan_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Morgan_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Morgan_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Morgan_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Morgan_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Morgan_PICKPOCKET_DoIt);
};

func void DIA_Addon_Morgan_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Morgan_PICKPOCKET);
};
	
func void DIA_Addon_Morgan_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Morgan_PICKPOCKET);
};
// ************************************************************
// 		  				  NICHT Anheuern
// ************************************************************
instance DIA_Addon_Morgan_Anheuern(C_INFO)
{
	npc			= PIR_1353_Addon_Morgan;
	nr			= 1;
	condition	= DIA_Addon_Morgan_Anheuern_Condition;
	information	= DIA_Addon_Morgan_Anheuern_Info;

	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Morgan_Anheuern_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (GregIsBack == TRUE)
	{
		return TRUE;
	};
};
func int DIA_Addon_Morgan_Anheuern_Info ()
{
	AI_Output (self, other, "DIA_Addon_Morgan_Anheuern_07_00"); //To je úžasný, teë budu muset furt âezat prkna.
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Addon_Morgan_Anheuern_07_01"); //(sarkasticky) Tak si to mlácení potvor užij!
	};
};

// ************************************************************
// 			  				  Hallo
// ************************************************************
INSTANCE DIA_Addon_Morgan_Hello(C_INFO)
{
	npc			= PIR_1353_Addon_Morgan;
	nr			= 1;
	condition	= DIA_Addon_Morgan_Hello_Condition;
	information	= DIA_Addon_Morgan_Hello_Info;
	permanent 	= TRUE;
	important	= TRUE;
};                      
FUNC INT DIA_Addon_Morgan_Hello_Condition()
{
	IF (MIS_AlligatorJack_BringMeat == FALSE)
	&& (Npc_IsInState (self,ZS_Talk))
	&& ((Npc_IsDead(AlligatorJack)) == FALSE)
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Morgan_Hello_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Morgan_Hello_15_00"); //Hej, ty!
	AI_Output (self ,other,"DIA_Addon_Morgan_Hello_07_01"); //(ospale) Co je? Co chceš?
	AI_Output (self ,other,"DIA_Addon_Morgan_Hello_07_02"); //(ospale) Už se vrátil Krokodýl Jack?
	AI_Output (self ,other,"DIA_Addon_Morgan_Hello_07_03"); //(ospale) Ne? Tak to urèitê pâijde co nevidêt. Dobrou noc.
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  		 Fleisch von Alli-Jack
// ************************************************************
INSTANCE DIA_Addon_Morgan_Meat(C_INFO)
{
	npc			= PIR_1353_Addon_Morgan;
	nr			= 2;
	condition	= DIA_Addon_Morgan_Meat_Condition;
	information	= DIA_Addon_Morgan_Meat_Info;

	description	= "Mám doruèit nêjaké maso.";
};                       
FUNC INT DIA_Addon_Morgan_Meat_Condition()
{
	IF (MIS_AlligatorJack_BringMeat == LOG_RUNNING)
	&& (Npc_HasItems (other,ItFoMuttonRaw) >= 1)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Morgan_Meat_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Morgan_Meat_15_00"); //Mám ti doruèit nêjaké maso.

	if (GregIsBack == FALSE)
	{
		AI_Output (self ,other,"DIA_Addon_Morgan_Meat_07_01"); //(probouzí se) Aáá, musím si nêèeho loknout, abych se vzbudil.
		
		CreateInvItems (self, ItFo_Booze, 3);									
		B_UseItem (self,ItFo_Booze);
		
		AI_Output (self ,other,"DIA_Addon_Morgan_Meat_07_02"); //To je lepší. Takže ještê jednou – co chceš?
		AI_Output (other,self ,"DIA_Addon_Morgan_Meat_15_03"); //Mám ti donést nêjaké maso od Krokodýla Jacka.
	};

	AI_Output (self ,other,"DIA_Addon_Morgan_Meat_07_04"); //No jo, maso. Už si vzpomínám. Tak ho sem dej!
	
	var int GivenMeat; GivenMeat = Npc_HasItems (other, ItFoMuttonRaw);
	
	if (GivenMeat > 10)
	{
		GivenMeat = 10;
	};
	
	B_GiveInvItems (other,self,ItFoMuttonRaw, GivenMeat);
	
	if (GivenMeat < 10)
	{
		AI_Output (self ,other,"DIA_Addon_Morgan_Meat_07_05"); //Cože? A to je všecko? Jsi zbytek zblajznul, ne? No, nevadí...
	};
	
	B_LogEntry (TOPIC_Addon_BringMeat,"Donesl jsem to maso Morganovi.");
	
	MIS_AlligatorJack_BringMeat = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_ALLIGatORJACK_BringMeat);
};

// ************************************************************
// 			 				Hallo 2 (Job)
// ************************************************************
INSTANCE DIA_Addon_Morgan_Job(C_INFO)
{
	npc			= PIR_1353_Addon_Morgan;
	nr			= 3;
	condition	= DIA_Addon_Morgan_Job_Condition;
	information	= DIA_Addon_Morgan_Job_Info;

	description	= "Co tady dêláš?";
};                       
FUNC INT DIA_Addon_Morgan_Job_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Morgan_Meat))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Morgan_Job_Info()
{	
	AI_Output (other, self, "DIA_Addon_Morgan_Job_15_01"); //Co tady dêláš?
	AI_Output (self, other, "DIA_Addon_Morgan_Job_07_01"); //Greg ze mê udêlal velitele jedný ze dvou nájezdnickejch skupin.
	AI_Output (self, other, "DIA_Addon_Morgan_Job_07_02"); //Zodpovídám za zásobování tábora – dohlíží na to Krokodýl Jack.
	AI_Output (self, other, "DIA_Addon_Morgan_Job_07_03"); //A taky mám na starosti, aby se všecky ty bestie, který tu najdeš, držely dál vod tábora.
	AI_Output (self, other, "DIA_Addon_Morgan_Job_07_04"); //To dêlaj CHLAPI.
	if (GregIsBack == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Morgan_Job_07_05"); //Âek jsem jim, že až se Greg vrátí, nechci tu vidêt ani jednu potvoru (zívá).
	};
};

// ************************************************************
// 			 			Faule Sau --> Lehrer		  
// ************************************************************
INSTANCE DIA_Addon_Morgan_Sleep(C_INFO)
{
	npc			= PIR_1353_Addon_Morgan;
	nr			= 4;
	condition	= DIA_Addon_Morgan_Sleep_Condition;
	information	= DIA_Addon_Morgan_Sleep_Info;

	description	= "Dêláš aspoà nêco taky sám?";
};                       
FUNC INT DIA_Addon_Morgan_Sleep_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Morgan_Job))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Morgan_Sleep_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Morgan_Sleep_15_00"); //A dêláš taky nêco sám?
	AI_Output (self ,other,"DIA_Addon_Morgan_Sleep_07_01"); //Tyhle kecy si nech vod cesty.
	AI_Output (self ,other,"DIA_Addon_Morgan_Sleep_07_02"); //Mùj úkol je nejdùležitêjší ze všech.
	AI_Output (self ,other,"DIA_Addon_Morgan_Sleep_07_03"); //Já svý lidi cvièím.
	AI_Output (self ,other,"DIA_Addon_Morgan_Sleep_07_04"); //Dêlám z nich nejlepší a nejobávanêjší bojovníky, který se po têchhle vodách kdy plavili.
	AI_Output (self ,other,"DIA_Addon_Morgan_Sleep_07_05"); //A rozhodnê to nedêlaj pro nic za nic.
	AI_Output (self ,other,"DIA_Addon_Morgan_Sleep_07_06"); //Dostanou za to poâádnej váèek zlata.
};

// ************************************************************
// ***														***
// 							Entertrupp
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 						Ich will mitmachen!
// ------------------------------------------------------------
instance DIA_Addon_Morgan_JoinMorgan(C_INFO)
{
	npc			= PIR_1353_Addon_Morgan;
	nr			= 5;
	condition	= DIA_Addon_Morgan_JoinMorgan_Condition;
	information	= DIA_Addon_Morgan_JoinMorgan_Info;

	description	= "Chci se k vám pâidat.";
};                       
FUNC INT DIA_Addon_Morgan_JoinMorgan_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Morgan_Sleep))
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Morgan_JoinMorgan_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Morgan_JoinMorgan_15_00"); //Chci se ke tvému oddílu pâidat.
	AI_Output (self ,other,"DIA_Addon_Morgan_JoinMorgan_07_01"); //(smêje se) K mýmu voddílu? Ten se potlouká nêkde po pláži.
	AI_Output (self ,other,"DIA_Addon_Morgan_JoinMorgan_07_03"); //Ti chlapi nehnou prstem, dokud se kapitán nevrátí, to je jistý.
	AI_Output (self ,other,"DIA_Addon_Morgan_JoinMorgan_07_04"); //Ale jestli chceš všem ukázat, že za nêco stojíš, klidnê tu práci na severní pláži udêlej za nê.
	AI_Output (self ,other,"DIA_Addon_Morgan_JoinMorgan_07_05"); //Je tam plno èíhavcù a kdo ví èeho ještê.
	AI_Output (self ,other,"DIA_Addon_Morgan_JoinMorgan_07_06"); //Jestli je zlikviduješ sám, všichni si tê (zííív) budou vážit.
	AI_Output (self ,other,"DIA_Addon_Morgan_JoinMorgan_07_07"); //Tak tê vítám ve svým voddíle. Ha! A teë si zase lehnu!
	
	Log_CreateTopic (TOPIC_Addon_MorganBeach,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_MorganBeach,LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MorganBeach,"Když jsem se pâidal k Morganovým lupièùm, dostal jsem nový úkol: mám vyèistit severní pláž ode všech potvor.");
	
	MIS_Addon_MorganLurker = LOG_RUNNING;
	AI_StopProcessInfos (self);
};

// ------------------------------------------------------------
// 							LurkerPlatt
// ------------------------------------------------------------
instance DIA_Addon_Morgan_LurkerPlatt		(C_INFO)
{
	npc		 	= PIR_1353_Addon_Morgan;
	nr		 	= 6;
	condition	= DIA_Addon_Morgan_LurkerPlatt_Condition;
	information	= DIA_Addon_Morgan_LurkerPlatt_Info;
	permanent	= TRUE;
	description	= "Severní pláž už je èistá.";
};
func int DIA_Addon_Morgan_LurkerPlatt_Condition ()
{
	if (Npc_IsDead(BeachLurker1))
	&& (Npc_IsDead(BeachLurker2))
	&& (Npc_IsDead(BeachLurker3))
	&& (Npc_IsDead(BeachWaran1))
	&& (Npc_IsDead(BeachWaran2))
	&& (MIS_Addon_MorganLurker == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Addon_Morgan_LurkerPlatt_Info ()
{
	AI_Output (other, self, "DIA_Addon_Morgan_LurkerPlatt_15_00"); //Severní pláž už je úplnê vyèištêná.
	AI_Output (self, other, "DIA_Addon_Morgan_LurkerPlatt_07_01"); //A co ta jeskynê? Tam už jsi taky byl?
		
	if (Npc_IsDead(BeachShadowbeast1))
	{
		AI_Output	(other, self, "DIA_Addon_Morgan_LurkerPlatt_15_02"); //No jasnê.
		AI_Output	(self, other, "DIA_Addon_Morgan_LurkerPlatt_07_03"); //Prima, seš fakt dobrej chlap.
		AI_Output	(self, other, "DIA_Addon_Morgan_LurkerPlatt_07_04"); //Tady máš odmênu.
		CreateInvItems (self, ItMi_Gold, 150);									
		B_GiveInvItems (self, other, ItMi_Gold, 150);
		
		B_LogEntry (TOPIC_Addon_MorganBeach,"Pláž už je vyèištêná - všechny potvory jsou pryè.");
		
		MIS_Addon_MorganLurker = LOG_SUCCESS;
				
		B_GivePlayerXP (XP_Addon_Morgan_LurkerPlatt);
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Morgan_LurkerPlatt_15_05"); //Ehm...
		AI_Output	(self, other, "DIA_Addon_Morgan_LurkerPlatt_07_06"); //No, ta k tomu taky patâí. Vraã se, až to budeš mít celý.
		
		B_LogEntry (TOPIC_Addon_MorganBeach,"Morgan také chce, abych se postaral o jeskyni.");
		
		AI_StopProcessInfos (self);
	};
};

// ------------------------------------------------------------
//						Sonst noch Auftrag?
// ------------------------------------------------------------
instance DIA_Addon_Morgan_Auftrag2		(C_INFO)
{
	npc		 	= PIR_1353_Addon_Morgan;
	nr		 	= 99;
	condition	= DIA_Addon_Morgan_Auftrag2_Condition;
	information	= DIA_Addon_Morgan_Auftrag2_Info;
	permanent	= TRUE;
	description	= "Mám udêlat ještê nêco?";
};
func int DIA_Addon_Morgan_Auftrag2_Condition ()
{
	if (MIS_Addon_MorganLurker == LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Addon_Morgan_Auftrag2_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Morgan_Auftrag2_15_00"); //Mám udêlat ještê nêco?

	if (GregIsBack == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Morgan_Auftrag2_07_01"); //Teë ne.
		AI_Output	(self, other, "DIA_Addon_Morgan_Auftrag2_07_02"); //Najdi si àákej kavalec na spaní a dej si poâádnou flašku rumu!
		CreateInvItems (self, ItFo_Booze, 3);									
		B_UseItem (self,ItFo_Booze);
		AI_Output	(self, other, "DIA_Addon_Morgan_Auftrag2_07_03"); //Aáá, to je dobrá vêc.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Morgan_Auftrag2_07_04"); //Radši by ses mêl zeptat kapitána.
	};
	
	AI_StopProcessInfos (self);
};



//**************************************************
//				Angus und Hank (Ring)
//**************************************************
var int Morgan_AngusStory;
//--------------------------------------------------
instance DIA_Addon_Morgan_FOUNDTHEM(C_INFO)
{
	npc			= PIR_1353_Addon_Morgan;
	nr			= 7;
	condition	= DIA_Addon_Morgan_FOUNDTHEM_Condition;
	information	= DIA_Addon_Morgan_FOUNDTHEM_Info;
	permanent	= TRUE;
	description	= "Co se týèe Anguse a Hanka...";
};                       
FUNC INT DIA_Addon_Morgan_FOUNDTHEM_Condition()
{
	if (MIS_Addon_Morgan_SeekTraitor != LOG_SUCCESS)
	&& (Npc_KnowsInfo (other, DIA_Addon_Skip_AngusHank))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Morgan_FOUNDTHEM_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Morgan_FOUNDTHEM_15_00"); //Co se týèe Anguse a Hanka...
	
	if (Morgan_AngusStory == FALSE)
	{
		AI_Output (self ,other,"DIA_Addon_Morgan_FOUNDTHEM_07_01"); //Ani mi je nepâipomínej!
		AI_Output (self ,other,"DIA_Addon_Morgan_FOUNDTHEM_07_02"); //Nejspíš je zabili piráti.
		AI_Output (self ,other,"DIA_Addon_Morgan_FOUNDTHEM_07_03"); //A Angus mêl u sebe mùj prsten.
		AI_Output (self ,other,"DIA_Addon_Morgan_FOUNDTHEM_07_04"); //No, svým zpùsobem byl ten prsten JEHO, páè ho na mnê vyhrál v kostkách.
		AI_Output (self ,other,"DIA_Addon_Morgan_FOUNDTHEM_07_05"); //Ale stejnê bych ho rád získal zpátky, a teë je nadobro PRYÈ!
		Morgan_AngusStory = TRUE;
	};

	Info_ClearChoices (DIA_Addon_Morgan_FOUNDTHEM);
	if (Npc_HasItems (other, ItRi_Addon_MorgansRing_Mission) > 0)
	{
		Info_AddChoice (DIA_Addon_Morgan_FOUNDTHEM, "Našel jsem je.", DIA_Addon_Morgan_FOUNDTHEM_Now);
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Morgan_FOUNDTHEM_07_06"); //Jestli najdeš mùj prsten, pâines mi ho. Vyplatí se ti to, to ti garantuju!
	};
};
func void DIA_Addon_Morgan_FOUNDTHEM_Now()
{
	AI_Output (other,self ,"DIA_Addon_Morgan_FOUNDTHEM_15_01"); //Našel jsem je.
	AI_Output (self ,other,"DIA_Addon_Morgan_FOUNDTHEM_07_07"); //Tak povídej, kde jsou?
	AI_Output (other,self ,"DIA_Addon_Morgan_FOUNDTHEM_15_03"); //Jsou mrtví.
	AI_Output (self ,other,"DIA_Addon_Morgan_FOUNDTHEM_07_08"); //A ten prsten? Co ten prsten?
	Info_ClearChoices (DIA_Addon_Morgan_FOUNDTHEM);
	Info_AddChoice (DIA_Addon_Morgan_FOUNDTHEM,"Tady to je.",DIA_Addon_Morgan_FOUNDTHEM_GiveRing);
	Info_AddChoice (DIA_Addon_Morgan_FOUNDTHEM,"Nemêli to u sebe.",DIA_Addon_Morgan_FOUNDTHEM_NoRing);
};
func void DIA_Addon_Morgan_FOUNDTHEM_NoRing()
{
	AI_Output (other,self ,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_15_00"); //Nemêli ho u sebe.
	AI_Output (self ,other,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_07_01"); //(zdêšenê) Cože? Vraã se tam podívej se po nêm ještê jednou! Museli ho mít!
	AI_Output (self ,other,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_07_02"); //Je to malej prstýnek se spoustou složitejch vornamentù.
	AI_Output (self ,other,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_07_03"); //MUSÍŠ ho najít, prostê MUSÍŠ!
	Info_ClearChoices (DIA_Addon_Morgan_FOUNDTHEM);
};
func void DIA_Addon_Morgan_FOUNDTHEM_GiveRing()
{
	AI_Output (other, self ,"DIA_Addon_Morgan_FOUNDTHEM_GiveRing_15_00"); //Tady je.
	B_GiveInvItems (other, self ,ItRi_Addon_MorgansRing_Mission,1);
	AI_Output (self, other,"DIA_Addon_Morgan_FOUNDTHEM_GiveRing_07_01"); //(šãastný jako dêcko) Jo, to je von! Hodnej kluk!
	AI_Output (self, other,"DIA_Addon_Morgan_FOUNDTHEM_GiveRing_07_02"); //Tumáš, vem si tuhle kamennou tabulku. Vypadá sice jako bezcennej krám, ale Garett za ni vysolí pêknê tuènou sumièku.
	
	MIS_Addon_Morgan_SeekTraitor = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_MorgansRing);
	Info_ClearChoices (DIA_Addon_Morgan_FOUNDTHEM);
	
	//PATCH M.F.
	B_GiveInvItems (self, other, ItWr_StonePlateCommon_Addon,1);
};



//**************************************************
//			Francis
//**************************************************

INSTANCE DIA_Addon_Morgan_Francis(C_INFO)
{
	npc			= PIR_1353_Addon_Morgan;
	nr			= 5;
	condition	= DIA_Addon_Morgan_Francis_Condition;
	information	= DIA_Addon_Morgan_Francis_Info;

	description	= "Co si myslíš o Francisovi?";
};                       
FUNC INT DIA_Addon_Morgan_Francis_Condition()
{
	if (Francis_ausgeschissen == FALSE)
	{
		if (Npc_KnowsInfo (other, DIA_Addon_Skip_GregsHut))
		|| (Francis.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			return TRUE;
		};
	};	
};

FUNC VOID DIA_Addon_Morgan_Francis_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Morgan_Francis_15_00"); //Co si myslíš o Francisovi?
	AI_Output (self ,other,"DIA_Addon_Morgan_Francis_07_01"); //Nevadí mi, (hrozivê) pokud mê nechává na pokoji.
	AI_Output (other,self ,"DIA_Addon_Morgan_Francis_15_02"); //Copak to není zdejší šéf?
	AI_Output (self ,other,"DIA_Addon_Morgan_Francis_07_03"); //(zlý smích) MYSLÍ si, že je tu šéf.
	AI_Output (self ,other,"DIA_Addon_Morgan_Francis_07_04"); //(škodolibê) Ale až se vrátí Greg, Francis bude zase jen âezat fošny.
};


// ************************************************************
// ***														***
//							TEACH
// ***														***
// ************************************************************

// ------------------------------------------------------------
// 							Wanna Learn  
// ------------------------------------------------------------
INSTANCE DIA_Addon_Morgan_TRAIN(C_INFO)
{
	npc			= PIR_1353_Addon_Morgan;
	nr			= 5;
	condition	= DIA_Addon_Morgan_TRAIN_Condition;
	information	= DIA_Addon_Morgan_TRAIN_Info;

	description	= "A mohl bys vycvièit taky MÊ?";
};                       
FUNC INT DIA_Addon_Morgan_TRAIN_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Morgan_Sleep))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Morgan_TRAIN_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Morgan_TRAIN_15_00"); //Mohl bys vycvièit i MÊ?
	AI_Output (self ,other,"DIA_Addon_Morgan_TRAIN_07_01"); //Jasnê, mùžu ti ukázat, jak bojovat jednoruèníma zbranêma.
	
	Log_CreateTopic (Topic_Addon_PIR_Teacher,LOG_NOTE);
	B_LogEntry (Topic_Addon_PIR_Teacher,Log_Text_Addon_MorganTeach);
	
	Morgan_Addon_TeachPlayer = TRUE;
};

// ------------------------------------------------------------
// 		  		Unterrichte mich!
// ------------------------------------------------------------
var int Morgan_merke1h;
var int Morgan_Labercount;
// ------------------------------------------------------------
instance DIA_Addon_Morgan_Teach(C_INFO)
{
	npc			= PIR_1353_Addon_Morgan;
	nr			= 99;
	condition	= DIA_Addon_Morgan_Teach_Condition;
	information	= DIA_Addon_Morgan_Teach_Info;
	permanent	= TRUE;
	description	= "Chci se nêco nauèit!";
};                       
FUNC INT DIA_Addon_Morgan_Teach_Condition()
{
	if (Morgan_Addon_TeachPlayer == TRUE)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Morgan_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Morgan_Teach_15_00"); //Nauè mê nêco!
	
	Morgan_merke1h = other.HitChance[NPC_TALENT_1H];  
	
	Info_ClearChoices 	(DIA_Addon_Morgan_Teach);
	Info_AddChoice 		(DIA_Addon_Morgan_Teach, DIALOG_BACK		,DIA_Addon_Morgan_Teach_Back);
	Info_AddChoice		(DIA_Addon_Morgan_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Addon_Morgan_Teach_1H_1);
	Info_AddChoice		(DIA_Addon_Morgan_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)*5)			,DIA_Addon_Morgan_Teach_1H_5);
};
func VOID DIA_Addon_Morgan_Teach_Back()
{
	if (other.HitChance[NPC_TALENT_1H] > Morgan_Merke1h)
	{
		if (Morgan_Labercount == 0)
		{
			AI_Output (self,other,"DIA_Addon_Morgan_CommentFightSkill_07_00"); //Zapomeà na ty kecy vo cti a tak. Když nezabiješ, skonèíš zabitej.
			Morgan_Labercount = 1;	
		}
		else if (Morgan_Labercount == 1)
		{
			AI_Output (self,other,"DIA_Addon_Morgan_CommentFightSkill_07_01"); //Pâíštê se musíš nauèit dávat do úderù vêtší sílu.
			Morgan_Labercount = 2;	
		}
		else if (Morgan_Labercount == 2)
		{
			AI_Output (self,other,"DIA_Addon_Morgan_CommentFightSkill_07_02"); //Ha, ha, ha, aspoà že teë udržíš meè.
			Morgan_Labercount = 0;	
		};
	}
	else if (other.HitChance[NPC_TALENT_1H] >= 75)
	{
		AI_Output (self ,other,"DIA_Addon_Morgan_Teach_Back_07_00"); //Jestli chceš bejt ještê lepší, budeš se muset uèit u nêkoho jinýho.
	};
	Info_ClearChoices (DIA_Addon_Morgan_Teach);
};
func VOID DIA_Addon_Morgan_Teach_1H_1()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 75);
			
	Info_ClearChoices 	(DIA_Addon_Morgan_Teach);
	Info_AddChoice 		(DIA_Addon_Morgan_Teach,	DIALOG_BACK		,DIA_Addon_Morgan_Teach_Back);
	Info_AddChoice		(DIA_Addon_Morgan_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Addon_Morgan_Teach_1H_1);
	Info_AddChoice		(DIA_Addon_Morgan_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)*5)			,DIA_Addon_Morgan_Teach_1H_5);
};

FUNC VOID DIA_Addon_Morgan_Teach_1H_5()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 75);

	Info_ClearChoices 	(DIA_Addon_Morgan_Teach);
	Info_AddChoice 		(DIA_Addon_Morgan_Teach,	DIALOG_BACK		,DIA_Addon_Morgan_Teach_Back);
	Info_AddChoice		(DIA_Addon_Morgan_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Addon_Morgan_Teach_1H_1);
	Info_AddChoice		(DIA_Addon_Morgan_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)*5)			,DIA_Addon_Morgan_Teach_1H_5);
};



















