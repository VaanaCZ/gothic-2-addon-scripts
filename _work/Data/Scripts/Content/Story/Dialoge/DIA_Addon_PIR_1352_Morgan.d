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
		AI_Output	(other, self, "DIA_Addon_Morgan_Perm_15_00"); //B� se nat�hnout.
		if (Morgan_Perm_Counter == 0)
		{
			AI_Output	(self, other, "DIA_Addon_Morgan_Perm_07_01"); //(z�v�) Dobrej n�pad.
			Morgan_Perm_Counter = 1;
		}
		else if (Morgan_Perm_Counter == 1)
		{
			AI_Output	(self, other, "DIA_Addon_Morgan_Perm_07_02"); //(ospale) Tak teda dobrou noc.
			Morgan_Perm_Counter = 2;
		}
		else if (Morgan_Perm_Counter == 2)
		{
			AI_Output	(self, other, "DIA_Addon_Morgan_Perm_07_03"); //(unaven�) S nejv�t�� radost�.
			Morgan_Perm_Counter = 3;
		}
		else if (Morgan_Perm_Counter == 3)
		{
			AI_Output	(self, other, "DIA_Addon_Morgan_Perm_07_04"); //Kdyby n�co, tak m� vzbu�.
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
	AI_Output (self, other, "DIA_Addon_Morgan_Anheuern_07_00"); //To je ��asn�, te� budu muset furt �ezat prkna.
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Addon_Morgan_Anheuern_07_01"); //(sarkasticky) Tak si to ml�cen� potvor u�ij!
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
	AI_Output (self ,other,"DIA_Addon_Morgan_Hello_07_01"); //(ospale) Co je? Co chce�?
	AI_Output (self ,other,"DIA_Addon_Morgan_Hello_07_02"); //(ospale) U� se vr�til Krokod�l Jack?
	AI_Output (self ,other,"DIA_Addon_Morgan_Hello_07_03"); //(ospale) Ne? Tak to ur�it� p�ijde co nevid�t. Dobrou noc.
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

	description	= "M�m doru�it n�jak� maso.";
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
	AI_Output (other,self ,"DIA_Addon_Morgan_Meat_15_00"); //M�m ti doru�it n�jak� maso.

	if (GregIsBack == FALSE)
	{
		AI_Output (self ,other,"DIA_Addon_Morgan_Meat_07_01"); //(probouz� se) A��, mus�m si n��eho loknout, abych se vzbudil.
		
		CreateInvItems (self, ItFo_Booze, 3);									
		B_UseItem (self,ItFo_Booze);
		
		AI_Output (self ,other,"DIA_Addon_Morgan_Meat_07_02"); //To je lep��. Tak�e je�t� jednou � co chce�?
		AI_Output (other,self ,"DIA_Addon_Morgan_Meat_15_03"); //M�m ti don�st n�jak� maso od Krokod�la Jacka.
	};

	AI_Output (self ,other,"DIA_Addon_Morgan_Meat_07_04"); //No jo, maso. U� si vzpom�n�m. Tak ho sem dej!
	
	var int GivenMeat; GivenMeat = Npc_HasItems (other, ItFoMuttonRaw);
	
	if (GivenMeat > 10)
	{
		GivenMeat = 10;
	};
	
	B_GiveInvItems (other,self,ItFoMuttonRaw, GivenMeat);
	
	if (GivenMeat < 10)
	{
		AI_Output (self ,other,"DIA_Addon_Morgan_Meat_07_05"); //Co�e? A to je v�ecko? Jsi zbytek zblajznul, ne? No, nevad�...
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

	description	= "Co tady d�l�?";
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
	AI_Output (other, self, "DIA_Addon_Morgan_Job_15_01"); //Co tady d�l�?
	AI_Output (self, other, "DIA_Addon_Morgan_Job_07_01"); //Greg ze m� ud�lal velitele jedn� ze dvou n�jezdnickejch skupin.
	AI_Output (self, other, "DIA_Addon_Morgan_Job_07_02"); //Zodpov�d�m za z�sobov�n� t�bora � dohl�� na to Krokod�l Jack.
	AI_Output (self, other, "DIA_Addon_Morgan_Job_07_03"); //A taky m�m na starosti, aby se v�ecky ty bestie, kter� tu najde�, dr�ely d�l vod t�bora.
	AI_Output (self, other, "DIA_Addon_Morgan_Job_07_04"); //To d�laj CHLAPI.
	if (GregIsBack == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Morgan_Job_07_05"); //�ek jsem jim, �e a� se Greg vr�t�, nechci tu vid�t ani jednu potvoru (z�v�).
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

	description	= "D�l� aspo� n�co taky s�m?";
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
	AI_Output (other,self ,"DIA_Addon_Morgan_Sleep_15_00"); //A d�l� taky n�co s�m?
	AI_Output (self ,other,"DIA_Addon_Morgan_Sleep_07_01"); //Tyhle kecy si nech vod cesty.
	AI_Output (self ,other,"DIA_Addon_Morgan_Sleep_07_02"); //M�j �kol je nejd�le�it�j�� ze v�ech.
	AI_Output (self ,other,"DIA_Addon_Morgan_Sleep_07_03"); //J� sv� lidi cvi��m.
	AI_Output (self ,other,"DIA_Addon_Morgan_Sleep_07_04"); //D�l�m z nich nejlep�� a nejob�van�j�� bojovn�ky, kter� se po t�chhle vod�ch kdy plavili.
	AI_Output (self ,other,"DIA_Addon_Morgan_Sleep_07_05"); //A rozhodn� to ned�laj pro nic za nic.
	AI_Output (self ,other,"DIA_Addon_Morgan_Sleep_07_06"); //Dostanou za to po��dnej v��ek zlata.
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

	description	= "Chci se k v�m p�idat.";
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
	AI_Output (other,self ,"DIA_Addon_Morgan_JoinMorgan_15_00"); //Chci se ke tv�mu odd�lu p�idat.
	AI_Output (self ,other,"DIA_Addon_Morgan_JoinMorgan_07_01"); //(sm�je se) K m�mu vodd�lu? Ten se potlouk� n�kde po pl�i.
	AI_Output (self ,other,"DIA_Addon_Morgan_JoinMorgan_07_03"); //Ti chlapi nehnou prstem, dokud se kapit�n nevr�t�, to je jist�.
	AI_Output (self ,other,"DIA_Addon_Morgan_JoinMorgan_07_04"); //Ale jestli chce� v�em uk�zat, �e za n�co stoj�, klidn� tu pr�ci na severn� pl�i ud�lej za n�.
	AI_Output (self ,other,"DIA_Addon_Morgan_JoinMorgan_07_05"); //Je tam plno ��havc� a kdo v� �eho je�t�.
	AI_Output (self ,other,"DIA_Addon_Morgan_JoinMorgan_07_06"); //Jestli je zlikviduje� s�m, v�ichni si t� (z���v) budou v�it.
	AI_Output (self ,other,"DIA_Addon_Morgan_JoinMorgan_07_07"); //Tak t� v�t�m ve sv�m vodd�le. Ha! A te� si zase lehnu!
	
	Log_CreateTopic (TOPIC_Addon_MorganBeach,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_MorganBeach,LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MorganBeach,"Kdy� jsem se p�idal k Morganov�m lupi��m, dostal jsem nov� �kol: m�m vy�istit severn� pl� ode v�ech potvor.");
	
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
	description	= "Severn� pl� u� je �ist�.";
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
	AI_Output (other, self, "DIA_Addon_Morgan_LurkerPlatt_15_00"); //Severn� pl� u� je �pln� vy�i�t�n�.
	AI_Output (self, other, "DIA_Addon_Morgan_LurkerPlatt_07_01"); //A co ta jeskyn�? Tam u� jsi taky byl?
		
	if (Npc_IsDead(BeachShadowbeast1))
	{
		AI_Output	(other, self, "DIA_Addon_Morgan_LurkerPlatt_15_02"); //No jasn�.
		AI_Output	(self, other, "DIA_Addon_Morgan_LurkerPlatt_07_03"); //Prima, se� fakt dobrej chlap.
		AI_Output	(self, other, "DIA_Addon_Morgan_LurkerPlatt_07_04"); //Tady m� odm�nu.
		CreateInvItems (self, ItMi_Gold, 150);									
		B_GiveInvItems (self, other, ItMi_Gold, 150);
		
		B_LogEntry (TOPIC_Addon_MorganBeach,"Pl� u� je vy�i�t�n� - v�echny potvory jsou pry�.");
		
		MIS_Addon_MorganLurker = LOG_SUCCESS;
				
		B_GivePlayerXP (XP_Addon_Morgan_LurkerPlatt);
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Morgan_LurkerPlatt_15_05"); //Ehm...
		AI_Output	(self, other, "DIA_Addon_Morgan_LurkerPlatt_07_06"); //No, ta k tomu taky pat��. Vra� se, a� to bude� m�t cel�.
		
		B_LogEntry (TOPIC_Addon_MorganBeach,"Morgan tak� chce, abych se postaral o jeskyni.");
		
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
	description	= "M�m ud�lat je�t� n�co?";
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
	AI_Output	(other, self, "DIA_Addon_Morgan_Auftrag2_15_00"); //M�m ud�lat je�t� n�co?

	if (GregIsBack == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Morgan_Auftrag2_07_01"); //Te� ne.
		AI_Output	(self, other, "DIA_Addon_Morgan_Auftrag2_07_02"); //Najdi si ��kej kavalec na span� a dej si po��dnou fla�ku rumu!
		CreateInvItems (self, ItFo_Booze, 3);									
		B_UseItem (self,ItFo_Booze);
		AI_Output	(self, other, "DIA_Addon_Morgan_Auftrag2_07_03"); //A��, to je dobr� v�c.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Morgan_Auftrag2_07_04"); //Rad�i by ses m�l zeptat kapit�na.
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
	description	= "Co se t��e Anguse a Hanka...";
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
	AI_Output (other,self ,"DIA_Addon_Morgan_FOUNDTHEM_15_00"); //Co se t��e Anguse a Hanka...
	
	if (Morgan_AngusStory == FALSE)
	{
		AI_Output (self ,other,"DIA_Addon_Morgan_FOUNDTHEM_07_01"); //Ani mi je nep�ipom�nej!
		AI_Output (self ,other,"DIA_Addon_Morgan_FOUNDTHEM_07_02"); //Nejsp� je zabili pir�ti.
		AI_Output (self ,other,"DIA_Addon_Morgan_FOUNDTHEM_07_03"); //A Angus m�l u sebe m�j prsten.
		AI_Output (self ,other,"DIA_Addon_Morgan_FOUNDTHEM_07_04"); //No, sv�m zp�sobem byl ten prsten JEHO, p�� ho na mn� vyhr�l v kostk�ch.
		AI_Output (self ,other,"DIA_Addon_Morgan_FOUNDTHEM_07_05"); //Ale stejn� bych ho r�d z�skal zp�tky, a te� je nadobro PRY�!
		Morgan_AngusStory = TRUE;
	};

	Info_ClearChoices (DIA_Addon_Morgan_FOUNDTHEM);
	if (Npc_HasItems (other, ItRi_Addon_MorgansRing_Mission) > 0)
	{
		Info_AddChoice (DIA_Addon_Morgan_FOUNDTHEM, "Na�el jsem je.", DIA_Addon_Morgan_FOUNDTHEM_Now);
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Morgan_FOUNDTHEM_07_06"); //Jestli najde� m�j prsten, p�ines mi ho. Vyplat� se ti to, to ti garantuju!
	};
};
func void DIA_Addon_Morgan_FOUNDTHEM_Now()
{
	AI_Output (other,self ,"DIA_Addon_Morgan_FOUNDTHEM_15_01"); //Na�el jsem je.
	AI_Output (self ,other,"DIA_Addon_Morgan_FOUNDTHEM_07_07"); //Tak pov�dej, kde jsou?
	AI_Output (other,self ,"DIA_Addon_Morgan_FOUNDTHEM_15_03"); //Jsou mrtv�.
	AI_Output (self ,other,"DIA_Addon_Morgan_FOUNDTHEM_07_08"); //A ten prsten? Co ten prsten?
	Info_ClearChoices (DIA_Addon_Morgan_FOUNDTHEM);
	Info_AddChoice (DIA_Addon_Morgan_FOUNDTHEM,"Tady to je.",DIA_Addon_Morgan_FOUNDTHEM_GiveRing);
	Info_AddChoice (DIA_Addon_Morgan_FOUNDTHEM,"Nem�li to u sebe.",DIA_Addon_Morgan_FOUNDTHEM_NoRing);
};
func void DIA_Addon_Morgan_FOUNDTHEM_NoRing()
{
	AI_Output (other,self ,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_15_00"); //Nem�li ho u sebe.
	AI_Output (self ,other,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_07_01"); //(zd�en�) Co�e? Vra� se tam pod�vej se po n�m je�t� jednou! Museli ho m�t!
	AI_Output (self ,other,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_07_02"); //Je to malej prst�nek se spoustou slo�itejch vornament�.
	AI_Output (self ,other,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_07_03"); //MUS͊ ho naj�t, prost� MUS͊!
	Info_ClearChoices (DIA_Addon_Morgan_FOUNDTHEM);
};
func void DIA_Addon_Morgan_FOUNDTHEM_GiveRing()
{
	AI_Output (other, self ,"DIA_Addon_Morgan_FOUNDTHEM_GiveRing_15_00"); //Tady je.
	B_GiveInvItems (other, self ,ItRi_Addon_MorgansRing_Mission,1);
	AI_Output (self, other,"DIA_Addon_Morgan_FOUNDTHEM_GiveRing_07_01"); //(��astn� jako d�cko) Jo, to je von! Hodnej kluk!
	AI_Output (self, other,"DIA_Addon_Morgan_FOUNDTHEM_GiveRing_07_02"); //Tum�, vem si tuhle kamennou tabulku. Vypad� sice jako bezcennej kr�m, ale Garett za ni vysol� p�kn� tu�nou sumi�ku.
	
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

	description	= "Co si mysl� o Francisovi?";
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
	AI_Output (other,self ,"DIA_Addon_Morgan_Francis_15_00"); //Co si mysl� o Francisovi?
	AI_Output (self ,other,"DIA_Addon_Morgan_Francis_07_01"); //Nevad� mi, (hroziv�) pokud m� nech�v� na pokoji.
	AI_Output (other,self ,"DIA_Addon_Morgan_Francis_15_02"); //Copak to nen� zdej�� ��f?
	AI_Output (self ,other,"DIA_Addon_Morgan_Francis_07_03"); //(zl� sm�ch) MYSL� si, �e je tu ��f.
	AI_Output (self ,other,"DIA_Addon_Morgan_Francis_07_04"); //(�kodolib�) Ale a� se vr�t� Greg, Francis bude zase jen �ezat fo�ny.
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

	description	= "A mohl bys vycvi�it taky M�?";
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
	AI_Output (other,self ,"DIA_Addon_Morgan_TRAIN_15_00"); //Mohl bys vycvi�it i M�?
	AI_Output (self ,other,"DIA_Addon_Morgan_TRAIN_07_01"); //Jasn�, m��u ti uk�zat, jak bojovat jednoru�n�ma zbran�ma.
	
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
	description	= "Chci se n�co nau�it!";
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
	AI_Output (other,self ,"DIA_Addon_Morgan_Teach_15_00"); //Nau� m� n�co!
	
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
			AI_Output (self,other,"DIA_Addon_Morgan_CommentFightSkill_07_00"); //Zapome� na ty kecy vo cti a tak. Kdy� nezabije�, skon�� zabitej.
			Morgan_Labercount = 1;	
		}
		else if (Morgan_Labercount == 1)
		{
			AI_Output (self,other,"DIA_Addon_Morgan_CommentFightSkill_07_01"); //P��t� se mus� nau�it d�vat do �der� v�t�� s�lu.
			Morgan_Labercount = 2;	
		}
		else if (Morgan_Labercount == 2)
		{
			AI_Output (self,other,"DIA_Addon_Morgan_CommentFightSkill_07_02"); //Ha, ha, ha, aspo� �e te� udr�� me�.
			Morgan_Labercount = 0;	
		};
	}
	else if (other.HitChance[NPC_TALENT_1H] >= 75)
	{
		AI_Output (self ,other,"DIA_Addon_Morgan_Teach_Back_07_00"); //Jestli chce� bejt je�t� lep��, bude� se muset u�it u n�koho jin�ho.
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



















