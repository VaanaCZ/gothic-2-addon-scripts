// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Addon_BDT_10018_Torwache_EXIT (C_INFO)
{
	npc			= BDT_10018_Addon_Torwache;
	nr			= 999;
	condition	= DIA_Addon_BDT_10018_Torwache_EXIT_Condition;
	information	= DIA_Addon_BDT_10018_Torwache_EXIT_Info;
	permanent	= TRUE;
	description	= "Nous reparlerons plus tard.";
};        
         
FUNC INT DIA_Addon_BDT_10018_Torwache_EXIT_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_BDT_10018_Torwache_EXIT_Info()
{
	AI_Output (other, self,"DIA_Addon_BDT_10018_Torwache_EXIT_15_00"); //Nous reparlerons plus tard.
	
	if (BDT_100018_Einmal == FALSE)
	{
		AI_Output (self, other,"DIA_Addon_BDT_10018_Torwache_EXIT_04_01"); //Vous savez d�j� ce que je vous dirai...
		BDT_100018_Einmal = TRUE;
	}
	else
	{
		AI_Output (self, other,"DIA_Addon_BDT_10018_Torwache_EXIT_04_02"); //Fichez le camp.
	};
	AI_StopProcessInfos	(self);
};
 
		
// ************************************************************
// 				  	Guard_Passage - First Warn
// ************************************************************

// -----------------------------------------------------------
	const string BDT_10018_Checkpoint	= "BL_RAVEN_CHECK";	
// -----------------------------------------------------------
	
instance DIA_Addon_BDT_10018_Torwache_FirstWarn (C_INFO)
{
	npc			= BDT_10018_Addon_Torwache;
	nr			= 1;
	condition	= DIA_Addon_BDT_10018_Torwache_FirstWarn_Condition;
	information	= DIA_Addon_BDT_10018_Torwache_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func int DIA_Addon_BDT_10018_Torwache_FirstWarn_Condition()
{
	if (Npc_GetDistToWP(other, BDT_10018_Checkpoint) <= 700) //NICHT von hinten!
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

func void DIA_Addon_BDT_10018_Torwache_FirstWarn_Info()
{
	
	if ( BDT_100018_Tells == FALSE)
	{
		AI_Output (self, other,"DIA_Addon_BDT_10018_Torwache_FirstWarn_04_00"); //H�, doucement ! Pas question que vous entriez l�-dedans, alors d�gagez !
		AI_Output (other, self,"DIA_Addon_BDT_10018_Torwache_FirstWarn_15_01"); //Hors de mon chemin - je dois voir Raven.
		AI_Output (self, other,"DIA_Addon_BDT_10018_Torwache_FirstWarn_04_02"); //Personne n'est autoris� � entrer dans ce secteur. Ordres de Raven lui-m�me.
		BDT_100018_Tells = TRUE;
		
		Log_CreateTopic (Topic_Addon_Tempel,LOG_MISSION);
		Log_SetTopicStatus (Topic_Addon_Tempel,LOG_RUNNING);
		B_LogEntry (Topic_Addon_Tempel,"Le gardien post� devant le temple ne me laissera pas passer. Je vais devoir trouver un moyen d'y rentrer.");
	}
	else
	{	
		AI_Output (self, other,"DIA_Addon_BDT_10018_Torwache_FirstWarn_04_03"); //Encore vous ? Vous commencez � me fatiguer...
		//AI_StopProcessInfos(self);
	};			
	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP(other,BDT_10018_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_FirstWarnGiven;
};
// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************

INSTANCE DIA_Addon_BDT_10018_Torwache_SecondWarn (C_INFO)
{
	npc			= BDT_10018_Addon_Torwache;
	nr			= 2;
	condition	= DIA_Addon_BDT_10018_Torwache_SecondWarn_Condition;
	information	= DIA_Addon_BDT_10018_Torwache_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Addon_BDT_10018_Torwache_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_FirstWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,BDT_10018_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	)) 
	{
		return TRUE;
	};
};

func void DIA_Addon_BDT_10018_Torwache_SecondWarn_Info()
{
	AI_Output (self, other,"DIA_Addon_BDT_10018_Torwache_SecondWarn_04_00"); //Un pas de plus, et ce sera votre dernier !

	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP (other,BDT_10018_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_SecondWarnGiven;	
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************

INSTANCE DIA_Addon_BDT_10018_Torwache_Attack (C_INFO)
{
	npc			= BDT_10018_Addon_Torwache;
	nr			= 3;
	condition	= DIA_Addon_BDT_10018_Torwache_Attack_Condition;
	information	= DIA_Addon_BDT_10018_Torwache_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Addon_BDT_10018_Torwache_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_SecondWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,BDT_10018_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	))
	{
		return TRUE;
	};
};

func void DIA_Addon_BDT_10018_Torwache_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] 			= 0;
	self.aivar[AIV_Guardpassage_Status]	= GP_NONE;						//wird auch in ZS_Attack resettet
	
	AI_Output (self, other,"DIA_Addon_BDT_10018_Torwache_Attack_04_00"); //Pour Raven !
	
	AI_StopProcessInfos	(self);
	B_Attack (self, other, AR_GuardStopsIntruder, 0); 
};
//----------------------------------------------------------------------
//	Info Wichtig
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10018_Torwache_Hi   (C_INFO)
{
	npc         = BDT_10018_Addon_Torwache;
	nr          = 2;
	condition   = DIA_Addon_10018_Torwache_Hi_Condition;
	information = DIA_Addon_10018_Torwache_Hi_Info;
	permanent   = FALSE;
	description = "Je dois le rencontrer, c'est vraiment important.";
};
FUNC INT DIA_Addon_10018_Torwache_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_10018_Torwache_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10018_Torwache_Hi_15_00");//Je dois le voir, c'est extr�mement important.
	AI_Output (self, other, "DIA_Addon_BDT_10018_Torwache_Hi_04_01");//Non, �a ne l'est pas. Seul Bloodwyn est autoris� � entrer.
	
	B_LogEntry (Topic_Addon_Tempel,"Seul Bloodwyn est autoris� � s�journer dans le temple. Peut-�tre pourrai-je acc�der au temple par son interm�diaire.");
};
//----------------------------------------------------------------------
//	Info Bloodwyn
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10018_Torwache_Bloodwyn   (C_INFO)
{
	npc         = BDT_10018_Addon_Torwache;
	nr          = 2;
	condition   = DIA_Addon_10018_Torwache_Bloodwyn_Condition;
	information = DIA_Addon_10018_Torwache_Bloodwyn_Info;
	permanent   = FALSE;
	description = "Bloodwyn ? Il n'est pas cens� �tre mort ?";
};
FUNC INT DIA_Addon_10018_Torwache_Bloodwyn_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_BDT_10018_Torwache_Hi)
	&& !Npc_IsDead (Bloodwyn)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_10018_Torwache_Bloodwyn_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10018_Torwache_Bloodwyn_15_00");//Bloodwyn ? Il n'est pas cens� �tre mort ?
	AI_Output (self, other, "DIA_Addon_BDT_10018_Torwache_Bloodwyn_04_01");//Il est plus fort que jamais. Et s'il d�couvre que vous �tes en train de nous chercher des crosses ici, il vous mettra lui-m�me en pi�ces.
};
//----------------------------------------------------------------------
//	Info Bribe
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10018_Torwache_Bribe   (C_INFO)
{
	npc         = BDT_10018_Addon_Torwache;
	nr          = 9;
	condition   = DIA_Addon_10018_Torwache_Bribe_Condition;
	information = DIA_Addon_10018_Torwache_Bribe_Info;
	permanent   = FALSE;
	description = "Je vous donnerai 1000 pi�ces d'or si vous me laissez entrer.";
};
FUNC INT DIA_Addon_10018_Torwache_Bribe_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_BDT_10018_Torwache_Hi)
	&& !Npc_IsDead (Bloodwyn)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_10018_Torwache_Bribe_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10018_Torwache_Bribe_15_00");//Je vous donnerai mille pi�ces d'or si vous me laissez passer.
	AI_Output (self, other, "DIA_Addon_BDT_10018_Torwache_Bribe_04_01");//Vous perdez votre temps, pauvre loque.
};
//----------------------------------------------------------------------
//	Info Drin
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10018_Torwache_Drin   (C_INFO)
{
	npc         = BDT_10018_Addon_Torwache;
	nr          = 90;
	condition   = DIA_Addon_10018_Torwache_Drin_Condition;
	information = DIA_Addon_10018_Torwache_Drin_Info;
	permanent   = FALSE;
	description = "Bloodwyn est � l'int�rieur ? Faites-le sortir, alors !";
};
FUNC INT DIA_Addon_10018_Torwache_Drin_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_BDT_10018_Torwache_Hi)
	&& !Npc_IsDead (Bloodwyn)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_10018_Torwache_Drin_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10018_Torwache_Drin_15_00");//Bloodwyn est � l'int�rieur ? Alors faites-le sortir de l�.
	AI_Output (self, other, "DIA_Addon_BDT_10018_Torwache_Drin_04_01");//Ha ! Vous croyez vraiment que je ferais �a ?
	AI_Output (self, other, "DIA_Addon_BDT_10018_Torwache_Drin_04_02");//Peut-�tre que vous �tes quelqu'un d'important � l'int�rieur du camp... mais votre pouvoir s'arr�te ICI MEME. Compris ?
	AI_Output (self, other, "DIA_Addon_BDT_10018_Torwache_Drin_04_03");//Alors allez � la mine chercher de l'or, ou je ne sais quoi - mais ne restez pas ici � me g�ner !
	
	MIS_BloodwynRaus = LOG_RUNNING;

	B_LogEntry (Topic_Addon_Tempel,"Bloodwyn se trouve � l'int�rieur du temple. Cela dit, �a ne m'avance � rien. Je devrais peut-�tre aller voir ce qui se trame � l'int�rieur de la mine.");
};
//----------------------------------------------------------------------
//	Info kopf
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10018_Torwache_kopf   (C_INFO)
{
	npc         = BDT_10018_Addon_Torwache;
	nr          = 90;
	condition   = DIA_Addon_10018_Torwache_kopf_Condition;
	information = DIA_Addon_10018_Torwache_kopf_Info;
	permanent   = FALSE;
	description = "(montrer la t�te de Bloodwyn)";
};
FUNC INT DIA_Addon_10018_Torwache_kopf_Condition()
{	
	if( Npc_HasItems (other, ItMi_Addon_Bloodwyn_Kopf) >= 1)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_10018_Torwache_kopf_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10018_Torwache_kopf_15_00");//Tenez ! Vous comptez toujours essayer de m'arr�ter ?
	AI_Output (self, other, "DIA_Addon_BDT_10018_Torwache_kopf_04_01");//Ce... c'est... c'est Bloodwyn ? Beuark, c'est...
	AI_Output (self, other, "DIA_Addon_BDT_10018_Torwache_kopf_04_02");//Heu... oui, heu non ! Je veux dire... pfff... allez-y, apr�s tout.
	
	MIS_BloodwynRaus = LOG_SUCCESS;
	
	
	
	self.aivar[AIV_PASSGATE] = TRUE;	
	AI_StopProcessInfos(self);
};	
	
	
	


