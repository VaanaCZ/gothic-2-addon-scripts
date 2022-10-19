// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Ramon_EXIT (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 999;
	condition	= DIA_Addon_Ramon_EXIT_Condition;
	information	= DIA_Addon_Ramon_EXIT_Info;
	permanent	= TRUE;
	description	= DIALOG_ENDE;
};        
         
FUNC INT DIA_Addon_Ramon_EXIT_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_Addon_Ramon_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 				  	Guard_Passage - First Warn
// ************************************************************

// -----------------------------------------------------------
	const string BDT_1071_Checkpoint	= "BL_UP_CHECK";	
// -----------------------------------------------------------
	
instance DIA_Addon_Ramon_FirstWarn (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 1;
	condition	= DIA_Addon_Ramon_FirstWarn_Condition;
	information	= DIA_Addon_Ramon_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func int DIA_Addon_Ramon_FirstWarn_Condition()
{
	if (Npc_GetDistToWP(other, BDT_1071_Checkpoint) <= 700) //NICHT von hinten!
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_NONE		)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE		)
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE			)
	&&  (Npc_RefuseTalk(self) 							== FALSE 		))
	{
		return TRUE;
	};
};
func void DIA_Addon_Ramon_FirstWarn_Info()
{
	if Npc_IsDead (Franco)
	{
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_00"); //Tak co se tam stalo?
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_01"); //Uzemnil jsem Franca.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_02"); //Tak�e te� je na TOB�, aby ti l�n� psi po��dn� makali?
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_03"); //Hele, nenech�m se otravovat od n�jakejch lovc�. Chci se dostat do t�bora.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_04"); //Tak na to zapome�. Sejmul jsi Franca, tak�e te� to tu vede� ty. �upito presto, do pr�ce.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_05"); //Jestli to tu vedu, pak rozhoduju, kdo je pr�v� na �ad�.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_06"); //A rozhodl jsem se, �e dal�� p�jdu J�!
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_07"); //(sm�je se) To nen� tak lehk�. O NIKOHO jsme ne��dali, tak�e dovnit� nep�jde NIKDO.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_08"); //Thorus m��e lovc�m poslat nov�ho velitele a pak si m��u vevnit� trochu odd�chnout.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_09"); //(sm�je se) Ty se jen tak nevzd�, co? No dob�e, pohni zadkem, a� u� jsi uvnit�.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_10"); //Thorus se postar�, aby lovci nez�stali dlouho bez velitele.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_11"); //Na co �ek�? A koukej si vz�t krump��!
		
		self.aivar[AIV_PASSGATE] = TRUE;
		Player_HasTalkedToBanditCamp = TRUE;
		B_GivePlayerXP (XP_Addon_Hinein);
		AI_StopProcessInfos(self);
		
		
		AI_Teleport (Carlos,"BL_WAIT_FINN");//40 m Glumpsche
		
		B_StartOtherRoutine (Carlos,"START");
		B_StartOtherRoutine (Finn, "START");
	}
	else if (Ramon_News == FALSE)
	{
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_12"); //Hele, co chce�? Nedok�u si p�edstavit, �e by t� jen tak mirnyx-t�rnyx pustili pro t�bora.
		
		if Npc_KnowsInfo (other, DIA_Addon_Franco_HI)
		{
			AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_13"); //Pos�l� m� Franco. Chce v�d�t, jestli n�koho v t�bo�e nepot�ebujete.
		};
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_14"); //Jo, n�koho pot�ebujem. V�era nat�hnul brka dal�� chl�pek
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_15"); //Ten debil si zahr�val s Estebanem.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_16"); //Kdo je Esteban?
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_17"); //Velitel doln�ho t�bora. Rozhoduje, kdo p�jde do dolu.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_18"); //Tak vy�i� Francovi, �e Thorus chce nov�ho chlapa, jasn�?
		
		Log_CreateTopic (Topic_Addon_Franco,LOG_MISSION);
		Log_SetTopicStatus (Topic_Addon_Franco,LOG_RUNNING);
		B_LogEntry (Topic_Addon_Franco,"Thorus pot�ebuje v t�bo�e n�koho nov�ho. To bude Franca zaj�mat.");
		
		Info_ClearChoices (DIA_Addon_Ramon_FirstWarn);
		Info_AddChoice    (DIA_Addon_Ramon_FirstWarn,"Thorus? TEN Thorus?",DIA_Addon_Ramon_FirstWarn_YES);
		Info_AddChoice    (DIA_Addon_Ramon_FirstWarn,"Thorus? Nikdy jsem o n�m nesly�el...",DIA_Addon_Ramon_FirstWarn_NO);
		
		Ramon_News = TRUE;
	}
	else
	{
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_19"); //Hele, zpomal! Tady nen� nic k vid�n�. Koukej vypadnout!
		AI_StopProcessInfos(self);
	};
				
	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP(other,BDT_1071_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_FirstWarnGiven;
};
FUNC VOID DIA_Addon_Ramon_FirstWarn_YES()
{
	AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_YES_15_00"); //Thorus? TEN Thorus.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_01"); //Jo, TEN Thorus. TEN chlap, kterej cht�l nov� lidi.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_02"); //Ten chlap, kterej rozhoduje, kdy a jestli v�bec se n�kdo novej dostane z ba�iny a do t�bora.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_03"); //Nechce� mi snad namluvit, �e ho zn� n�kdy z d��v�j�ka.
	AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_YES_15_04"); //No... ano.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_05"); //Posly� � Thoruse zn� KA�D�.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_06"); //Ale stejn� dovnit� nep�jde� � a j� mu nic vzkazovat NEBUDU!
	
	Info_ClearChoices (DIA_Addon_Ramon_FirstWarn);
};
FUNC VOID DIA_Addon_Ramon_FirstWarn_NO()
{
	AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_NO_15_00"); //Thorus? O tom jsem nikdy nesly�el.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_NO_07_01"); //�ove�e, ty ho nezn�? Dyk to bejval ��f str�� ve Star�m t�bo�e.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_NO_07_02"); //Je to chlap, kter�mu tu ka�dej v���.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_NO_07_03"); //��d� o nov� lidi a rozhoduje, kdy a jestli v�bec se n�kdo z nov� p��choz�ch dostane do t�bora.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_NO_07_04"); //Jestli je�t� n�jakou dobu p�e�ije�, ur�it� ho pozn�.
	
	Info_ClearChoices (DIA_Addon_Ramon_FirstWarn);
};
// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************

INSTANCE DIA_Addon_Ramon_SecondWarn (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 2;
	condition	= DIA_Addon_Ramon_SecondWarn_Condition;
	information	= DIA_Addon_Ramon_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Addon_Ramon_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_FirstWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,BDT_1071_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	)) 
	{
		return TRUE;
	};
};

func void DIA_Addon_Ramon_SecondWarn_Info()
{
	AI_Output (self, other,"DIA_Addon_Ramon_SecondWarn_07_00"); //Je�t� krok a bude to tv�j posledn�!

	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP (other,BDT_1071_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_SecondWarnGiven;	
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************

INSTANCE DIA_Addon_Ramon_Attack (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 3;
	condition	= DIA_Addon_Ramon_Attack_Condition;
	information	= DIA_Addon_Ramon_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Addon_Ramon_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_SecondWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,BDT_1071_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	))
	{
		return TRUE;
	};
};

func void DIA_Addon_Ramon_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] 			= 0;
	self.aivar[AIV_Guardpassage_Status]	= GP_NONE;						//wird auch in ZS_Attack resettet
	
	AI_Output (self, other,"DIA_Addon_Ramon_Attack_07_00"); //N�kter� lidi se nikdy nepou��.
	
	AI_StopProcessInfos	(self);
	B_Attack (self, other, AR_GuardStopsIntruder, 0); 
};
// ************************************************************
// 			News
// ************************************************************
INSTANCE DIA_Addon_Ramon_News (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 10;
	condition	= DIA_Addon_Ramon_News_Condition;
	information	= DIA_Addon_Ramon_News_Info;
	permanent	= FALSE;
	description	= "J� jsem ten nov�.";
};                       

FUNC INT DIA_Addon_Ramon_News_Condition()
{	
	if !Npc_IsDead (Franco)
	{
		return TRUE;
	};
};
func void DIA_Addon_Ramon_News_Info()
{
	AI_Output (other, self,"DIA_Addon_Ramon_News_15_00"); //J� jsem ten novej.
	AI_Output (self, other,"DIA_Addon_Ramon_News_07_01"); //Hele, nesna� se m� nap�lit. O tom, kdo z v�s se dostane do t�bora, furt je�t� rozhoduje Franco.
};
// ************************************************************
// 			Lie
// ************************************************************
INSTANCE DIA_Addon_Ramon_Lie (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 10;
	condition	= DIA_Addon_Ramon_Lie_Condition;
	information	= DIA_Addon_Ramon_Lie_Info;
	permanent	= FALSE;
	description	= "Pos�l� m� Franco...";
};                       

FUNC INT DIA_Addon_Ramon_Lie_Condition()
{
	if Npc_KnowsInfo (other,DIA_Addon_Ramon_News)
	&& !Npc_IsDead (Franco)
	{
		return TRUE;
	};
};
func void DIA_Addon_Ramon_Lie_Info()
{
	AI_Output (other, self,"DIA_Addon_Ramon_Lie_15_00"); //Pos�l� m� Franco.
	AI_Output (self, other,"DIA_Addon_Ramon_Lie_07_01"); //Tak to teda ne. Koukej zmizet, ne� ti zp�el�mu hn�ty.
	
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			Perm
// ************************************************************
INSTANCE DIA_Addon_Ramon_Perm (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 99;
	condition	= DIA_Addon_Ramon_Perm_Condition;
	information	= DIA_Addon_Ramon_Perm_Info;
	permanent	= TRUE;
	description	= "Je v�ecko pod kontrolou?";
};                       

FUNC INT DIA_Addon_Ramon_Perm_Condition()
{
	if Npc_KnowsInfo (other,DIA_Addon_Ramon_News)
	&& !Npc_IsDead (Franco)
	{
		return TRUE;
	};
};
func void DIA_Addon_Ramon_Perm_Info()
{
	AI_Output (other, self,"DIA_Addon_Ramon_Perm_15_00"); //Je v�ecko pod kontrolou?
	AI_Output (self, other,"DIA_Addon_Ramon_Perm_07_01"); //V�ecko je v pohod�, pokud se sem nepokou�� vloudit n�kdo, kdo tu NEM� CO D�LAT
	
	AI_StopProcessInfos (self);
};


