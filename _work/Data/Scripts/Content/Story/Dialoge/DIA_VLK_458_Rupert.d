// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Rupert_EXIT(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 999;
	condition	= DIA_Rupert_EXIT_Condition;
	information	= DIA_Rupert_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Rupert_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Rupert_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Rupert_PICKPOCKET (C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 900;
	condition	= DIA_Rupert_PICKPOCKET_Condition;
	information	= DIA_Rupert_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Rupert_PICKPOCKET_Condition()
{
	C_Beklauen (18, 10);
};
 
FUNC VOID DIA_Rupert_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Rupert_PICKPOCKET);
	Info_AddChoice		(DIA_Rupert_PICKPOCKET, DIALOG_BACK 		,DIA_Rupert_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Rupert_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Rupert_PICKPOCKET_DoIt);
};

func void DIA_Rupert_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Rupert_PICKPOCKET);
};
	
func void DIA_Rupert_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Rupert_PICKPOCKET);
};
// ************************************************************
// 			  				   Hello 
// ************************************************************
INSTANCE DIA_Rupert_Hello(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 1;
	condition	= DIA_Rupert_Hello_Condition;
	information	= DIA_Rupert_Hello_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Rupert_Hello_Condition()
{
	if (Npc_IsInState (self,ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Rupert_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Rupert_Hello_03_00"); //Bonjour, �tranger.
	AI_Output (self ,other,"DIA_Rupert_Hello_03_01"); //Vous devez avoir faim et soif. Puis-je vous proposer quelque chose�?
};	

// ************************************************************
// 			  				 Zu Pal 
// ************************************************************
INSTANCE DIA_Rupert_ZuPal(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 1;
	condition	= DIA_Rupert_ZuPal_Condition;
	information	= DIA_Rupert_ZuPal_Info;
	permanent	= FALSE;
	description = "Je me rendais chez les paladins...";
};                       
FUNC INT DIA_Rupert_ZuPal_Condition()
{
	if (Kapitel < 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Rupert_ZuPal_Info()
{	
	AI_Output (other, self,"DIA_Rupert_ZuPal_15_00"); //En fait, je vais voir les paladins...
	AI_Output (self ,other,"DIA_Rupert_ZuPal_03_01"); //N'y comptez pas. Depuis qu'ils se sont install�s dans le haut quartier, plus personne ne peut y entrer, ou presque.
};	

// ************************************************************
// 			  			HelpMeIntoOV
// ************************************************************
INSTANCE DIA_Rupert_HelpMeIntoOV(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 1;
	condition	= DIA_Rupert_HelpMeIntoOV_Condition;
	information	= DIA_Rupert_HelpMeIntoOV_Info;
	permanent	= FALSE;
	description = "Pouvez-vous m'aider � acc�der au haut quartier ?";
};                       
FUNC INT DIA_Rupert_HelpMeIntoOV_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Rupert_ZuPal))
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Rupert_HelpMeIntoOV_Info()
{	
	AI_Output (other, self,"DIA_Rupert_HelpMeIntoOV_15_00"); //Pouvez-vous m'aider � acc�der au haut quartier�?
	AI_Output (self ,other,"DIA_Rupert_HelpMeIntoOV_03_01"); //Moi�? Je ne suis pas assez influent par ici.
	AI_Output (self ,other,"DIA_Rupert_HelpMeIntoOV_03_02"); //Il n'y a qu'une poign�e de gens suffisamment influents dans le bas quartier pour vous aider � franchir les gardes.
	AI_Output (self ,other,"DIA_Rupert_HelpMeIntoOV_03_03"); //Matt�o, mon patron, en fait justement partie. Peut-�tre devriez-vous aller le voir.
	
	Log_CreateTopic (TOPIC_OV,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_OV,LOG_RUNNING);
	B_LogEntry (TOPIC_OV,"Si je veux acc�der au haut quartier, je vais avoir besoin de l'aide de citoyens influents du bas quartier de la ville.");
	B_LogEntry (TOPIC_OV,"Le marchand Matt�o est une de ces personnes influentes du bas quartier.");
};	

// ***************************************************************
//							WoMatteo
// ***************************************************************
INSTANCE DIA_Rupert_WoMatteo(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 1;
	condition	= DIA_Rupert_WoMatteo_Condition;
	information	= DIA_Rupert_WoMatteo_Info;
	permanent	= FALSE;
	description = "O� puis-je trouver Matt�o ?";
};                      
FUNC INT DIA_Rupert_WoMatteo_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Rupert_HelpMeIntoOV))
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Rupert_WoMatteo_Info()
{	
	AI_Output (other,self ,"DIA_Rupert_WoMatteo_15_00"); //O� puis-je trouver Matt�o�?
	AI_Output (self ,other,"DIA_Rupert_WoMatteo_03_01"); //Vous �tes devant sa boutique. Entrez, il est presque toujours l�.
	
	if (Knows_Matteo == FALSE)
	{
		Log_CreateTopic (TOPIC_CityTrader, LOG_NOTE);
		B_LogEntry (TOPIC_CityTrader,"La boutique de Matt�o se trouve pr�s de la porte sud de la ville. Il vend des �quipements, des armes et des provisions.");
		Knows_Matteo = TRUE;
	};
};

// ***************************************************************
//							Wer hat Einflu�
// ***************************************************************
INSTANCE DIA_Rupert_WerEinfluss(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 2;
	condition	= DIA_Rupert_WerEinfluss_Condition;
	information	= DIA_Rupert_WerEinfluss_Info;
	permanent	= FALSE;
	description = "Qu'en est-il des autres citoyens influents ?";
};                      
FUNC INT DIA_Rupert_WerEinfluss_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Rupert_HelpMeIntoOV))
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Rupert_WerEinfluss_Info()
{	
	AI_Output (other,self ,"DIA_Rupert_WerEinfluss_15_00"); //Qui sont les autres citoyens influents�?
	AI_Output (self ,other,"DIA_Rupert_WerEinfluss_03_01"); //Les marchands et ma�tres artisans de la rue principale sont les gens les plus importants de la ville.
	AI_Output (self ,other,"DIA_Rupert_WerEinfluss_03_02"); //Essayez de devenir l'apprenti de l'un d'eux, comme moi.
	AI_Output (self ,other,"DIA_Rupert_WerEinfluss_03_03"); //Depuis que je travaille pour Matt�o, les autres habitants de la ville me traitent avec respect.
	
	B_LogEntry (TOPIC_OV,"Je devrais essayer de devenir l'apprenti d'un des ma�tres artisans.");
};

// ***************************************************************
//							Work
// ***************************************************************
INSTANCE DIA_Rupert_Work(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 3;
	condition	= DIA_Rupert_Work_Condition;
	information	= DIA_Rupert_Work_Info;
	permanent	= FALSE;
	description = "J'ai besoin d'argent et je cherche du travail.";
};                      
FUNC INT DIA_Rupert_Work_Condition()
{
	if (hero.guild == GIL_NONE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Rupert_Work_Info()
{	
	AI_Output (other,self ,"DIA_Rupert_Work_15_00"); //J'ai besoin d'argent et je cherche du travail.
	AI_Output (self ,other,"DIA_Rupert_Work_03_01"); //J'ai entendu dire que Bosper avait des soucis d'approvisionnement. Sa boutique est l�-bas.
	AI_Output (self ,other,"DIA_Rupert_Work_03_02"); //On dit qu'il paye plut�t bien.
};

// ***************************************************************
//							YourOffer
// ***************************************************************
INSTANCE DIA_Rupert_YourOffer(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 4;
	condition	= DIA_Rupert_YourOffer_Condition;
	information	= DIA_Rupert_YourOffer_Info;
	permanent	= FALSE;
	description = "Qu'avez-vous � m'offrir ?";
};                      
FUNC INT DIA_Rupert_YourOffer_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Rupert_YourOffer_Info()
{	
	AI_Output (other,self ,"DIA_Rupert_YourOffer_15_00"); //Qu'avez-vous � offrir�?
	AI_Output (self ,other,"DIA_Rupert_YourOffer_03_01"); //En ce moment, je n'ai pas beaucoup de choix.
	if (hero.guild != GIL_SLD)
	&& (hero.guild != GIL_DJG)
	{ 
		AI_Output (self ,other,"DIA_Rupert_YourOffer_03_02"); //Ce maudit propri�taire terrien ne nous livre plus et la production des petites fermes n'est pas assez importante par rapport � la demande d'une ville enti�re.
	};
};

// ************************************************************
//								Trade
// ************************************************************
INSTANCE DIA_Rupert_Trade(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 900;
	condition	= DIA_Rupert_Trade_Condition;
	information	= DIA_Rupert_Trade_Info;
	permanent	= TRUE;
	description = "Montrez-moi vos marchandises.";
	trade		= TRUE;
};                       
FUNC INT DIA_Rupert_Trade_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Rupert_YourOffer))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Rupert_Trade_Info()
{	
	if (Npc_HasItems (self, itfo_cheese) < 5)
	{
		CreateInvItems (self, ItFo_cheese, 5);
	};
	
	AI_Output (other,self ,"DIA_Rupert_Trade_15_00"); //Montrez-moi vos marchandises.
	if (hero.guild == GIL_KDF)
	|| (hero.guild == GIL_PAL)
	{
		AI_Output (self,other,"DIA_Rupert_Trade_03_01"); //Je vous prie de m'excuser pour le peu d'articles que j'ai � vous pr�senter. Un homme tel que vous doit �tre habitu� � mieux.
	};
};

// ************************************************************
// 			  				 Bauernaufstand
// ************************************************************
INSTANCE DIA_Rupert_Bauernaufstand(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 4;
	condition	= DIA_Rupert_Bauernaufstand_Condition;
	information	= DIA_Rupert_Bauernaufstand_Info;
	permanent	= FALSE;
	description = "Dites-m'en plus au sujet de la r�volte des paysans.";
};                       
FUNC INT DIA_Rupert_Bauernaufstand_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Rupert_YourOffer))
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Rupert_Bauernaufstand_Info()
{	
	AI_Output (other,self ,"DIA_Rupert_Bauernaufstand_15_00"); //Parlez-moi de la r�volte des paysans.
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_01"); //C'est on ne peut plus simple�: Onar, le propri�taire terrien, refuse d�sormais de verser la moindre taxe � la ville.
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_02"); //Vous imaginez�? Nous sommes en guerre avec les orques et ce gros pourceau veut tout pour lui�!
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_03"); //En temps normal, les gardes r�agiraient de mani�re tr�s stricte...
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_04"); //Mais voil� le plus beau�: il para�t qu'Onar a engag� des mercenaires pour tenir les miliciens loin de ses terres.
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_05"); //Des mercenaires, vous vous rendez compte�? �a va se finir par une guerre, cette histoire�! Comme si une ne suffisait pas...
};

// ***************************************************************
//							S�ldner
// ***************************************************************
INSTANCE DIA_Rupert_Mercs(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 4;
	condition	= DIA_Rupert_Mercs_Condition;
	information	= DIA_Rupert_Mercs_Info;
	permanent	= FALSE;
	description = "Que savez-vous au sujet des mercenaires d'Onar ?";
};                       
FUNC INT DIA_Rupert_Mercs_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Rupert_Bauernaufstand))
	&& (hero.guild != GIL_SLD)
	&& (hero.guild != GIL_DJG)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Rupert_Mercs_Info()
{	
	AI_Output (other,self ,"DIA_Rupert_Mercs_15_00"); //Que savez-vous au sujet des mercenaires d'Onar�?
	AI_Output (self	,other,"DIA_Rupert_Mercs_03_01"); //J'ai entendu dire que la plupart d'entre eux �taient d'anciens d�tenus de la colonie mini�re.
	AI_Output (self	,other,"DIA_Rupert_Mercs_03_02"); //Et leur chef est cens� avoir �t� un type important... un g�n�ral ou quelque chose comme �a... que le roi a fait enfermer pour trahison.
	AI_Output (self	,other,"DIA_Rupert_Mercs_03_03"); //Nous vivons vraiment une �poque tr�s difficile.
};



