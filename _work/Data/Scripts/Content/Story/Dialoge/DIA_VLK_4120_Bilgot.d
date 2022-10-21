///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Bilgot_EXIT   (C_INFO)
{
	npc         = VLK_4120_Bilgot;
	nr          = 999;
	condition   = DIA_Bilgot_EXIT_Condition;
	information = DIA_Bilgot_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Bilgot_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Bilgot_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_HALLO		(C_INFO)
{
	npc		 	 = 	VLK_4120_Bilgot;
	nr			 =  2;
	condition	 = 	DIA_Bilgot_HALLO_Condition;
	information	 = 	DIA_Bilgot_HALLO_Info;
	important	 = 	TRUE;
	permanent 	 =  FALSE;
};
func int DIA_Bilgot_HALLO_Condition ()
{
	return TRUE;
};
func void DIA_Bilgot_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Bilgot_HALLO_05_00"); //H�! D'o� venez-vous�? Du ch�teau�?

	Info_AddChoice	(DIA_Bilgot_HALLO, "Oui, je viens du ch�teau� Pourquoi ?", DIA_Bilgot_HALLO_Burg );
	Info_AddChoice	(DIA_Bilgot_HALLO, "Je suis ici par hasard...", DIA_Bilgot_HALLO_Zufall );
};
func void DIA_Bilgot_HALLO_Zufall ()
{
	AI_Output (other, self, "DIA_Bilgot_HALLO_Zufall_15_00"); //Je suis ici par le plus grand des hasards.
	AI_Output (self, other, "DIA_Bilgot_HALLO_Zufall_05_01"); //Personne ne vient ici par hasard, petit. Personne�! Nous sommes encercl�s par les saurinides.
	AI_Output (self, other, "DIA_Bilgot_HALLO_Zufall_05_02"); //Pas un jour ne se passe sans que l'un d'entre nous ne se fasse tuer.
	AI_Output (self, other, "DIA_Bilgot_HALLO_Zufall_05_03"); //Vous ne voulez pas me dire d'o� vous venez�? Parfait. Que les saurinides vous emportent�!
	
	AI_StopProcessInfos (self);
};

func void DIA_Bilgot_HALLO_Burg ()
{
	AI_Output (other, self, "DIA_Bilgot_HALLO_Burg_15_00"); //En effet, oui. Pourquoi�?
	AI_Output (self, other, "DIA_Bilgot_HALLO_Burg_05_01"); //Quelle est la situation l�-bas�?
	AI_Output (other, self, "DIA_Bilgot_HALLO_Burg_15_02"); //Elle n'est pas meilleure qu'ici. Les orques sont toujours l�, si c'est ce que vous vouliez savoir.
	AI_Output (self, other, "DIA_Bilgot_HALLO_Burg_05_03"); //Mal�diction�! On n'est plus en s�curit� nulle part...
	AI_Output (self, other, "DIA_Bilgot_HALLO_Burg_05_04"); //Je vais vous dire une chose�: si je n'�tais pas mort de trouille, je filerais sans demander mon reste.
	
	Info_ClearChoices	(DIA_Bilgot_HALLO);
};
///////////////////////////////////////////////////////////////////////
//	Info Job
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_Job		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr			 =  3;
	condition	 = 	DIA_Bilgot_Job_Condition;
	information	 = 	DIA_Bilgot_Job_Info;
	permanent 	 =  FALSE;
	description	 = 	"Mais qu'est-ce que vous faites ici ?";
};
func int DIA_Bilgot_Job_Condition ()
{
	return TRUE;
};
func void DIA_Bilgot_Job_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_Job_15_00"); //Que faites-vous ici ?
	AI_Output (self, other, "DIA_Bilgot_Job_05_01"); //Je suis comme qui dirait l'homme � tout faire : je transporte tout ce qui doit l'�tre, je garde un �il sur les saurinides... Bilgot par-ci, Bilgot par-l�...
	AI_Output (self, other, "DIA_Bilgot_Job_05_02"); //J'aurais d� rester chez moi, avec ma m�re. La situation ne valait gu�re mieux mais, au moins, je mangeais correctement.
	AI_Output (self, other, "DIA_Bilgot_Job_05_03"); //Et maintenant, je suis tout ce qui reste des hommes d'armes sous les ordres de Fajeth.
	AI_Output (self, other, "DIA_Bilgot_Job_05_04"); //Comment j'aurais pu savoir que l'exp�dition ne reviendrait pas, hein�?
	AI_Output (self, other, "DIA_Bilgot_Job_05_05"); //Je n'ai plus de nouvelles de mon pote Olav. Peut-�tre qu'il s'est tir�...
};
///////////////////////////////////////////////////////////////////////
//	Info Hilfe
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_Hilfe		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr 			 =  3;
	condition	 = 	DIA_Bilgot_Hilfe_Condition;
	information	 = 	DIA_Bilgot_Hilfe_Info;
	permanent 	 =  FALSE;
	description	 = 	"Que savez-vous au sujet des saurinides ?";
};
func int DIA_Bilgot_Hilfe_Condition ()
{
	if	(MIS_Fajeth_Kill_Snapper == LOG_RUNNING)	
	{
		return TRUE;
	};
};
func void DIA_Bilgot_Hilfe_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_Hilfe_15_00"); //Que savez-vous au sujet des saurinides�?
	AI_Output (self, other, "DIA_Bilgot_Hilfe_05_01"); //En quoi �a vous int�resse�? Et me dites pas que c'est par simple curiosit�!
	AI_Output (other, self, "DIA_Bilgot_Hilfe_15_02"); //J'ai l'intention de partir � la chasse au saurinide...
	AI_Output (self, other, "DIA_Bilgot_Hilfe_05_03"); //Vous �tes compl�tement dingue�! Ces sales b�tes sont assoiff�es de sang�! Je le sais, je les ai suffisamment observ�es�!
	AI_Output (other, self, "DIA_Bilgot_Hilfe_15_04"); //Dans ce cas, dites-moi ce que vous savez � leur sujet.
	AI_Output (self, other, "DIA_Bilgot_Hilfe_05_05"); //Hmm... je veux bien vous aider, mais � une condition.
	AI_Output (other, self, "DIA_Bilgot_Hilfe_15_06"); //Que voulez-vous ?
	AI_Output (self, other, "DIA_Bilgot_Hilfe_05_07"); //Si vous parvenez � tuer les saurinides, il faut que vous me fassiez sortir d'ici�!
	
	if ((Npc_IsDead (Fed)) == FALSE)
	{
		AI_Output (self, other, "DIA_Bilgot_Hilfe_05_08"); //Je n'en peux plus�! Vous avez parl� � Fed�? Il est dans un �tat pitoyable et je ne veux surtout pas finir comme lui�!
	};
};

///////////////////////////////////////////////////////////////////////
//	Info KnowsLeadSnapper
///////////////////////////////////////////////////////////////////////

instance DIA_Bilgot_KNOWSLEADSNAPPER		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr			 =  4;
	condition	 = 	DIA_Bilgot_KNOWSLEADSNAPPER_Condition;
	information	 = 	DIA_Bilgot_KNOWSLEADSNAPPER_Info;
	permanent 	 =  FALSE;
	description	 = 	"Dites-moi ce que vous savez et je vous sors d'ici !";
};

func int DIA_Bilgot_KNOWSLEADSNAPPER_Condition ()
{
	if ((Npc_KnowsInfo(other, DIA_Bilgot_Hilfe))
	&& (MIS_Fajeth_Kill_Snapper == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Bilgot_KNOWSLEADSNAPPER_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_KNOWSLEADSNAPPER_15_00"); //Dites-moi ce que vous savez et je vous tirerai d'ici.
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_01"); //Je savais que je pouvais compter sur vous. Bon, �coutez bien ce que je vais vous dire. �a fait longtemps que j'observe les saurinides...
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_02"); //Ils sont tr�s malins et semblent... communiquer entre eux. Ils ne se d�placent jamais seuls et attaquent toujours en meute.
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_03"); //Mais ce n'est pas tout. L'un d'eux est diff�rent. Il se montre rarement, mais je l'ai vu.
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_04"); //Tout les autres s'inclinent en passant devant lui, mais ils ne le perdent jamais de vue.
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_05"); //Et tant que lui ne bouge pas, les autres ne bougent pas non plus.
	AI_Output (other, self, "DIA_Bilgot_KNOWSLEADSNAPPER_15_06"); //O� puis-je le trouver�?
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_07"); //Je dirais... � proximit� de l'escalier conduisant � la vieille tour de garde.

	AI_Output (other, self, "DIA_Bilgot_KNOWSLEADSNAPPER_15_08"); //Parfait. Je crois comprendre. Merci.
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_09"); //N'oubliez pas, vous m'avez donn� votre parole�!

	Wld_InsertNpc (NewMine_LeadSnapper,"OW_ORC_LOOKOUT_2_01"); //Der Rudelf�hrer
	
	B_LogEntry (TOPIC_FajethKillSnapper,"Bilgot m'a parl� du chef de la meute des saurinides. Il devrait se trouver au pied de la vieille tour de guet."); 
	
	Log_CreateTopic (TOPIC_BilgotEscort,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BilgotEscort,LOG_RUNNING);
	B_LogEntry (TOPIC_BilgotEscort,"Bilgot veut que je le fasse sortir de la vall�e.");
		
};
///////////////////////////////////////////////////////////////////////
//	Info TakeYouWithMe
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_TAKEYOUWITHME		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr 			 =  2;
	condition	 = 	DIA_Bilgot_TAKEYOUWITHME_Condition;
	information	 = 	DIA_Bilgot_TAKEYOUWITHME_Info;
	permanent 	 =  FALSE;
	description	 = 	"(Tenir parole)";
};
func int DIA_Bilgot_TAKEYOUWITHME_Condition ()
{
	if (MIS_Fajeth_Kill_Snapper == LOG_SUCCESS)
 	&& Npc_KnowsInfo(other, DIA_Bilgot_KNOWSLEADSNAPPER)
 			{
				return TRUE;
 			};
};
func void DIA_Bilgot_TAKEYOUWITHME_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_TAKEYOUWITHME_15_00"); //C'est pour maintenant, Bilgot. Pr�parez vos affaires, on s'en va.
	//Joly: SC bringt den Typ bis zum Pass AI_Output (self, other, "DIA_Bilgot_TAKEYOUWITHME_05_01"); //Gro�artig! Es reicht mir schon, wenn du mich �ber die gro�e Br�cke am Fluss vor der belagerten Burg bringst. Den Rest schaff ich dann schon.
	//Joly: SC bringt den Typ bis zum Pass AI_Output (other, self, "DIA_Bilgot_TAKEYOUWITHME_15_02"); //Dann beeil dich!
	AI_Output (self, other, "DIA_Bilgot_TAKEYOUWITHME_05_03"); //Je suis pr�t !

	Npc_ExchangeRoutine	(self, "FOLLOWTOOCBRIDGE");
	Bilgot.flags	= 0;	
	MIS_RescueBilgot = LOG_RUNNING;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info LaufSchneller
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_LAUFSCHNELLER		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr			 =  5;
	condition	 = 	DIA_Bilgot_LAUFSCHNELLER_Condition;
	information	 = 	DIA_Bilgot_LAUFSCHNELLER_Info;
	permanent	 =  FALSE;
	description	 = 	"Vous ne pouvez pas marcher plus vite ?!";
};

func int DIA_Bilgot_LAUFSCHNELLER_Condition ()
{
	if ((Npc_KnowsInfo(other, DIA_Bilgot_TAKEYOUWITHME))
	&& ((Npc_KnowsInfo(other, DIA_Bilgot_BEIBRUECKEANGEKOMMEN))==FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bilgot_LAUFSCHNELLER_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_LAUFSCHNELLER_15_00"); //Vous ne pouvez pas marcher un peu plus vite�?
	AI_Output (self, other, "DIA_Bilgot_LAUFSCHNELLER_05_01"); //Je vais aussi vite que possible.
};
///////////////////////////////////////////////////////////////////////
//	Info BeiBrueckeAngekommen
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_BEIBRUECKEANGEKOMMEN		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr			 =  2;
	condition	 = 	DIA_Bilgot_BEIBRUECKEANGEKOMMEN_Condition;
	information	 = 	DIA_Bilgot_BEIBRUECKEANGEKOMMEN_Info;
	important	 = 	TRUE;
	permanent	 =  FALSE;
};
func int DIA_Bilgot_BEIBRUECKEANGEKOMMEN_Condition ()
{
	if (Npc_GetDistToWP(self,"START")<8000) 				
	{
		return TRUE;
	};
};

func void DIA_Bilgot_BEIBRUECKEANGEKOMMEN_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_BEIBRUECKEANGEKOMMEN_15_00"); //Nous y voil�! Allez-y et ne tra�nez pas, le coin est dangereux.
	AI_Output (self, other, "DIA_Bilgot_BEIBRUECKEANGEKOMMEN_05_01"); //Merci.
	AI_Output (other, self, "DIA_Bilgot_BEIBRUECKEANGEKOMMEN_15_02"); //Et ne vous faites pas croquer surtout, ce serait dommage.
	AI_Output (self, other, "DIA_Bilgot_BEIBRUECKEANGEKOMMEN_05_03"); //Adieu�!
	
	AI_StopProcessInfos (self);	
	TschuessBilgot = TRUE;
	MIS_RescueBilgot = LOG_SUCCESS;
	B_GivePlayerXP (XP_BilgotEscort);
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self, "FLEEOUTOFOW");
};
///////////////////////////////////////////////////////////////////////
//	Info LetztePause
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_LetztePause		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr			 = 	3;
	condition	 = 	DIA_Bilgot_LetztePause_Condition;
	information	 = 	DIA_Bilgot_LetztePause_Info;
	permanent	 = 	TRUE;
	description	 = 	"Que faites-vous ici ? Je croyais que vous alliez au col ?";
};

func int DIA_Bilgot_LetztePause_Condition ()
{
	if (Npc_GetDistToWP(self,"START")<1000) 				
	{
		return TRUE;
	};
};

func void DIA_Bilgot_LetztePause_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_LetztePause_15_00"); //Qu'est-ce que vous faites ici�? Je croyais que vous deviez essayer de franchir le col...
	AI_Output (self, other, "DIA_Bilgot_LetztePause_05_01"); //Je ne peux pas continuer. Laissez-moi me reposer quelques instants. Ne vous en faites pas, �a va aller.
	AI_Output (other, self, "DIA_Bilgot_LetztePause_15_02"); //Si vous le dites.
	AI_Output (self, other, "DIA_Bilgot_LetztePause_05_03"); //J'ai juste besoin de souffler un peu.
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Olav
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_Olav		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr			 = 	3;
	condition	 = 	DIA_Bilgot_Olav_Condition;
	information	 = 	DIA_Bilgot_Olav_Info;
	permanent	 = 	FALSE;
	description	 = 	"J'ai trouv� Olav.";
};

func int DIA_Bilgot_Olav_Condition ()
{
	if (Npc_HasItems (Olav, ITSE_Olav) == 0)	
	&& (Npc_KnowsInfo (other,DIA_Bilgot_Job))
	{
		return TRUE;
	};
};

func void DIA_Bilgot_Olav_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_Olav_15_00"); //J'ai retrouv� Olav.
	AI_Output (self, other, "DIA_Bilgot_Olav_05_01"); //Alors, qu'est-ce qu'il mijote�?
	AI_Output (other, self, "DIA_Bilgot_Olav_15_02"); //Il est mort. Les loups l'ont d�vor�.
	AI_Output (self, other, "DIA_Bilgot_Olav_05_03"); //Oh, fl�te�! J'esp�re que je vais r�ussir � sortir d'ici...
	
	B_GivePlayerXP (XP_Ambient);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Bilgot_PICKPOCKET (C_INFO)
{
	npc			= VLK_4120_Bilgot;
	nr			= 900;
	condition	= DIA_Bilgot_PICKPOCKET_Condition;
	information	= DIA_Bilgot_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Bilgot_PICKPOCKET_Condition()
{
	C_Beklauen (20, 30);
};
 
FUNC VOID DIA_Bilgot_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Bilgot_PICKPOCKET);
	Info_AddChoice		(DIA_Bilgot_PICKPOCKET, DIALOG_BACK 		,DIA_Bilgot_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Bilgot_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Bilgot_PICKPOCKET_DoIt);
};

func void DIA_Bilgot_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Bilgot_PICKPOCKET);
};
	
func void DIA_Bilgot_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Bilgot_PICKPOCKET);
};



