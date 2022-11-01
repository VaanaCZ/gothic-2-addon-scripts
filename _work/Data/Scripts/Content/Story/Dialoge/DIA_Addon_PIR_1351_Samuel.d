// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Samuel_EXIT(C_INFO)
{
	npc			= PIR_1351_Addon_Samuel;
	nr			= 999;
	condition	= DIA_Addon_Samuel_EXIT_Condition;
	information	= DIA_Addon_Samuel_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Samuel_EXIT_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Samuel_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				   Hello 
// ************************************************************
instance DIA_Addon_Samuel_Hello(C_INFO)
{
	npc			= PIR_1351_Addon_Samuel;
	nr			= 1;
	condition	= DIA_Addon_Samuel_Hello_Condition;
	information	= DIA_Addon_Samuel_Hello_Info;

	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Samuel_Hello_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Samuel_Hello_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Samuel_Hello_14_00"); //Ah, uno nuovo!
	AI_Output (self ,other, "DIA_Addon_Samuel_Hello_14_01"); //Cosa ti porto? Rum o qualcosa di più forte?
	
	Log_CreateTopic (Topic_Addon_PIR_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_PIR_Trader,Log_Text_Addon_SamuelTrade);
};

// ************************************************************
// 			  				Francis
// ************************************************************
instance DIA_Addon_Samuel_Francis(C_INFO)
{
	npc			= PIR_1351_Addon_Samuel;
	nr			= 2;
	condition	= DIA_Addon_Samuel_Francis_Condition;
	information	= DIA_Addon_Samuel_Francis_Info;

	description	= "Devo parlarti a proposito di Francis.";
};                       
FUNC INT DIA_Addon_Samuel_Francis_Condition()
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

FUNC VOID DIA_Addon_Samuel_Francis_Info()
{	
	AI_Output (other, self, "DIA_Addon_Samuel_Francis_15_00"); //Devo parlarti a proposito di Francis.
	AI_Output (self, other, "DIA_Addon_Samuel_Francis_14_01"); //Non mi parlare di quel lavativo! 
	AI_Output (self, other, "DIA_Addon_Samuel_Francis_14_02"); //Non fa nulla tutto il giorno e si dà un sacco di arie.
	AI_Output (self, other, "DIA_Addon_Samuel_Francis_14_03"); //Chissà cosa diamine aveva in mente il Capitano quando ha affidato a LUI il comando!
	AI_Output (self, other, "DIA_Addon_Samuel_Francis_14_04"); //Che cosa vuoi da quel farabutto?
};

// ************************************************************
// 			  		In Gregs Hütte (Versteck)
// ************************************************************
instance DIA_Addon_Samuel_Versteck(C_INFO)
{
	npc			= PIR_1351_Addon_Samuel;
	nr			= 3;
	condition	= DIA_Addon_Samuel_Versteck_Condition;
	information	= DIA_Addon_Samuel_Versteck_Info;

	description	= "Devo entrare nella capanna di Greg.";
};                       
FUNC INT DIA_Addon_Samuel_Versteck_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Samuel_Francis))
	&& (Francis_ausgeschissen == FALSE)
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Samuel_Versteck_Info()
{	
	AI_Output (other, self, "DIA_Addon_Samuel_Francis_15_02"); //Devo entrare nella capanna di Greg.
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_05"); //(furbescamente) Ma davvero? E perché?
	AI_Output (other, self, "DIA_Addon_Samuel_Francis_15_01"); //Mi serve l'armatura di un brigante.
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_06"); //(ride) Francis non ti permetterà MAI di entrare nella capanna di Greg per rubargli le sue cose.
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_07"); //A meno che...
	AI_Output (other, self,	"DIA_Addon_Samuel_Francis_15_03"); //Sì?
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_08"); //...tu non abbia qualcosa che lui vuole.
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_09"); //So che Francis ha nascosto qualcosa in una miniera abbandonata, nel canyon.
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_10"); //Una volta, mentre eravamo di guardia insieme, si è addormentato e ha cominciato a parlare nel sonno.
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_11"); //Non ho idea di cosa abbia sepolto lì, ma forse pur di riaverla accetterà di farti entrare nella capanna...
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_12"); //(felice) Quando il Capitano scoprirà il furto, gli leverà la pelle a suon di scudisciate, a Francis.

	B_LogEntry (TOPIC_Addon_BDTRuestung,"Samuel, che distilla alcol clandestinamente, ha parlato di un nascondiglio segreto di Francis in una delle miniere del canyon. Forse, posso trovarci qualcosa che mi aiuti a entrare nella capanna."); 
};

// ************************************************************
// 			  				Rezepte
// ************************************************************
var int Samuel_Knows_LousHammer;
var int Samuel_Knows_SchlafHammer;
// ------------------------------------------------------------
instance DIA_Addon_Samuel_Recipe(C_INFO)
{
	npc			= PIR_1351_Addon_Samuel;
	nr			= 4;
	condition	= DIA_Addon_Samuel_Recipe_Condition;
	information	= DIA_Addon_Samuel_Recipe_Info;
	permanent	= TRUE;
	description = "Ho una ricetta per te!";
};
func INT DIA_Addon_Samuel_Recipe_Condition()
{
	if ( (Samuel_Knows_LousHammer == FALSE) && (Npc_HasItems (other, ITWr_Addon_Lou_Rezept) > 0) )
	|| ( (Samuel_Knows_SchlafHammer == FALSE) && (Npc_HasItems (other, ITWr_Addon_Lou_Rezept2) > 0) )
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Samuel_Recipe_Info()
{
	AI_Output (other,self ,"DIA_Addon_Samuel_Recipe_15_00"); //Ho una ricetta per te!
	AI_Output (self ,other,"DIA_Addon_Samuel_Recipe_14_01"); //Fammi vedere. Che genere di ricetta?
	
	Info_ClearChoices (DIA_Addon_Samuel_Recipe);
	if (Samuel_Knows_LousHammer == FALSE) 
	&& (Npc_HasItems (other, ITWr_Addon_Lou_Rezept) > 0)
	{
		Info_AddChoice (DIA_Addon_Samuel_Recipe,"Martello di Lou",DIA_Addon_Samuel_Recipe_LousHammer);
	};
	if (Samuel_Knows_SchlafHammer == FALSE)
	&& (Npc_HasItems (other, ITWr_Addon_Lou_Rezept2) > 0)
	{
		Info_AddChoice (DIA_Addon_Samuel_Recipe,"Doppio Martello di Lou",DIA_Addon_Samuel_Recipe_LousDoubleHammer);
	};
};
func VOID DIA_Addon_Samuel_Recipe_Back()
{
	Info_ClearChoices (DIA_Addon_Samuel_Recipe);
};
func VOID DIA_Addon_Samuel_Recipe_LousHammer ()
{
	AI_Output (other,self ,"DIA_Addon_Samuel_Recipe_LousHammer_15_00"); //È di Snaf.
	B_GiveInvItems (other, self, ITWr_Addon_Lou_Rezept, 1);
	B_UseFakeScroll();
	AI_Output (self ,other,"DIA_Addon_Samuel_Recipe_LousHammer_14_04"); //Ma dev'essere terribile! Devo provarla subito!
	
	B_GivePlayerXP (XP_Ambient);
	Samuel_Knows_LousHammer = TRUE;
};
func VOID DIA_Addon_Samuel_Recipe_LousDoubleHammer ()
{
	AI_Output (other,self ,"DIA_Addon_Samuel_Recipe_LousDoubleHammer_15_00"); //Sta' attento! Questa roba è letale!
	B_GiveInvItems (other, self, ITWr_Addon_Lou_Rezept2, 1);
	B_UseFakeScroll();
	AI_Output (self ,other,"DIA_Addon_Samuel_Recipe_LousDoubleHammer_14_04"); //Mi stai facendo paura. Farò come dici tu.
	
	B_GivePlayerXP (XP_Ambient);
	Samuel_Knows_SchlafHammer = TRUE;
};

// ************************************************************
// 			  	  				 Grog
// ************************************************************
var int Samuel_Grog_Varianz;
// ------------------------------------------------------------
instance DIA_Addon_Samuel_Grog(C_INFO)
{
	npc			= PIR_1351_Addon_Samuel;
	nr			= 5;
	condition	= DIA_Addon_Samuel_Grog_Condition;
	information	= DIA_Addon_Samuel_Grog_Info;
	permanent	= TRUE;
	description = "Sono venuto a prendere la mia razione di grog! (10 monete d’oro)";
};                       
FUNC INT DIA_Addon_Samuel_Grog_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Samuel_Grog_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Samuel_Grog_15_00"); //Sono venuto per la mia razione di grog.
	if (B_GiveInvItems(other, self, itmi_gold, 10))
	{	
		if (Samuel_Grog_Varianz == 0)
		{
			AI_Output (self,other,"DIA_Addon_Samuel_Grog_14_01"); //Voi ragazzi non muovete un passo senza il vostro grog, eh? D'accordo, tieni.
			Samuel_Grog_Varianz = 1;
		}
		else if (Samuel_Grog_Varianz == 1)
		{
			AI_Output (self,other,"DIA_Addon_Samuel_Grog_14_02"); //Spero sia potabile. Sono rimasto a corto d'acqua dolce.. ma tanto l'acqua salmastra non ha mai ucciso nessuno, no?
			Samuel_Grog_Varianz = 2;
		}
		else // (Samuel_Grog_Varianz == 2)
		{
			AI_Output (self,other,"DIA_Addon_Samuel_Grog_14_03"); //Puoi prenderti tutto il grog che vuoi!
		};
		
		B_GiveInvItems (self,other,ItFo_Addon_Grog,1);
	}
	else //nicht genug Gold
	{
		AI_Output (self,other,"DIA_Addon_Samuel_Grog_14_04"); //Costa poco, ma non è gratis! Se vuoi bere, procurati dell'oro, ragazzo.
	};
};

// ************************************************************
// 			  	  				Rum
// ************************************************************
var int Samuel_Rum_Varianz;
// ------------------------------------------------------------
instance DIA_Addon_Samuel_Rum(C_INFO)
{
	npc			= PIR_1351_Addon_Samuel;
	nr			= 6;
	condition	= DIA_Addon_Samuel_Rum_Condition;
	information	= DIA_Addon_Samuel_Rum_Info;
	permanent	= TRUE;
	description = "Dammi del rum (30 monete d'oro)";
};                       
FUNC INT DIA_Addon_Samuel_Rum_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Samuel_Rum_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Samuel_Rum_15_00"); //Dammi del rum!
	
	if (B_GiveInvItems (other,self, ItMi_Gold, 30))
	{
		if (Samuel_Rum_Varianz == 0)
		{
			AI_Output (self ,other,"DIA_Addon_Samuel_Rum_14_01"); //Ah! Per un marinaio è come il latte della mamma!
			Samuel_Rum_Varianz = 1;
		}
		else if (Samuel_Rum_Varianz == 1)
		{
			AI_Output (self ,other,"DIA_Addon_Samuel_Rum_14_02"); //Forse sa un po' di pesce, perché qi abbiamo solo vecchi barili di aringhe. Ma il rum è sempre rum. Alla tua salute!
			Samuel_Rum_Varianz = 2;
		}
		else // (Samuel_Rum_Varianz == 2)
		{
			AI_Output (self ,other,"DIA_Addon_Samuel_Rum_14_03"); //Ecco.
		};
				
		B_GiveInvItems (self,other,ItFo_Addon_rum,1);
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Samuel_Rum_14_04"); //Non hai abbastanza oro! Che ne dici di un po' di grog?
	};		
};

// ************************************************************
// 			  	  			Was Stärkeres
// ************************************************************
var int Samuel_Stronger_Varianz;
var int Samuel_DoppelHammer_Varianz;
// ------------------------------------------------------------
instance DIA_Addon_Samuel_Stronger(C_INFO)
{
	npc			= PIR_1351_Addon_Samuel;
	nr			= 7;
	condition	= DIA_Addon_Samuel_Stronger_Condition;
	information	= DIA_Addon_Samuel_Stronger_Info;
	permanent	= TRUE;
	description = "Voglio qualcosa di più forte!";
};
                       
FUNC INT DIA_Addon_Samuel_Stronger_Condition()
{
	return TRUE;
};

func VOID DIA_Addon_Samuel_Stronger_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Samuel_Stronger_15_00"); //Voglio qualcosa di più forte!
	
	if (Samuel_Stronger_Varianz == 0)
	{
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_01"); //Ah, un intenditore! Anch'io cerco sempre ricette nuove.
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_02"); //Un buon liquore dev'essere chiaro e forte, e bruciare la gola come fuoco liquido.
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_03"); //Non se ne trova molto, così. Ma io sto parlando troppo, e tu hai sete!
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_04"); //Tieni! È una mia ricetta! Che te ne pare? Si chiama 'Aringa Furiosa'.
		B_GiveInvItems (self,other,ItFo_Addon_Schnellerhering,1);
		B_UseItem (other, ItFo_Addon_Schnellerhering);
		AI_Output (other,self ,"DIA_Addon_Samuel_Stronger_15_05"); //Notevole!
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_06"); //(ride) Puoi dirlo forte! 
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_07"); //Non è che puoi darmi qualche buona ricetta per un liquore?
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_08"); //Un altro?
		Samuel_Stronger_Varianz = 1;
	}
	else // (Samuel_Stronger_Varianz == 1)
	{
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_09"); //Cosa ti porto?
	};
	
	Info_ClearChoices (DIA_Addon_Samuel_Stronger);
	Info_AddChoice (DIA_Addon_Samuel_Stronger, DIALOG_BACK, DIA_Addon_Samuel_Stronger_Back);
	if (Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Doppio Martello di Lou (60 monete d'oro)", DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};		
	if (Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Martello di Lou (30 monete d'oro)", DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice (DIA_Addon_Samuel_Stronger, "Aringa furiosa (30 monete d'oro)", DIA_Addon_Samuel_Stronger_SchnellerHering);
};
// ------------------------------------------------------------
func void B_Addon_Samuel_NoGold()
{
	AI_Output (self, other, "DIA_Addon_Samuel_NoGold_14_00"); //Senz'oro non si beve!
};
// ------------------------------------------------------------

func VOID DIA_Addon_Samuel_Stronger_Back()
{
	Info_ClearChoices (DIA_Addon_Samuel_Stronger);
};
func VOID DIA_Addon_Samuel_Stronger_SchnellerHering()
{
	AI_Output (other,self ,"DIA_Addon_Samuel_Stronger_SchnellerHering_15_00"); //Dammi un'Aringa Furiosa.
	if (B_GiveInvItems (other,self, ItMi_Gold, 30))
	{
		AI_Output (self ,other,"DIa_Addon_Samuel_Stronger_SchnellerHering_14_01"); //Un intruglio immondo, ma efficace!
		B_GiveInvItems (self, other, ItFo_Addon_SchnellerHering, 1);
	}
	else
	{
		B_Addon_Samuel_NoGold();
	};
	
	Info_ClearChoices (DIA_Addon_Samuel_Stronger);
	Info_AddChoice (DIA_Addon_Samuel_Stronger, DIALOG_BACK, DIA_Addon_Samuel_Stronger_Back);
	if (Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Doppio Martello di Lou (60 monete d'oro)", DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};		
	if (Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Martello di Lou (30 monete d'oro)", DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice (DIA_Addon_Samuel_Stronger, "Aringa furiosa (30 monete d'oro)", DIA_Addon_Samuel_Stronger_SchnellerHering);
};
func VOID DIA_Addon_Samuel_Stronger_LousHammer()
{
	AI_Output (other,self ,"DIA_Addon_Samuel_Stronger_LousHammer_15_00"); //Voglio un Martello di Lou!
	if (B_GiveInvItems (other, self, ItMi_Gold, 30))
	{
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_LousHammer_14_01"); //Ottimo! Giù nel gargarozzo!
		B_GiveInvItems (self,other,ItFo_Addon_LousHammer,1);
	}
	else
	{
		B_Addon_Samuel_NoGold();
	};
	
	Info_ClearChoices (DIA_Addon_Samuel_Stronger);
	Info_AddChoice (DIA_Addon_Samuel_Stronger, DIALOG_BACK, DIA_Addon_Samuel_Stronger_Back);
	if (Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Doppio Martello di Lou (60 monete d'oro)", DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};		
	if (Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Martello di Lou (30 monete d'oro)", DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice (DIA_Addon_Samuel_Stronger, "Aringa furiosa (30 monete d'oro)", DIA_Addon_Samuel_Stronger_SchnellerHering);
};
func VOID DIA_Addon_Samuel_Stronger_LousDoubleHammer()
{
	AI_Output (other,self ,"DIA_Addon_Samuel_Stronger_LousDoubleHammer_15_00"); //(indifferente) Dammi un doppio Martello.
	if (B_GiveInvItems (other,self,ItMi_Gold,Value_SchlafHammer))
	{
		if (Samuel_DoppelHammer_Varianz == 0)
		{
			AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_LousDoubleHammer_14_01"); //Non far nulla di cui potresti pentirti, ragazzo. Non vorrai mica berlo tu, vero?
		}
		else
		{
			AI_Output (self ,other,"DIa_Addon_Samuel_Stronger_LousDoubleHammer_14_02"); //(con foga) Sì! Non c'è nulla di meglio per tirarsi su!
		};

		B_GiveInvItems (self,other,ItFo_Addon_SchlafHammer,1);
	}
	else
	{
		B_Addon_Samuel_NoGold();
	};
	
	Info_ClearChoices (DIA_Addon_Samuel_Stronger);
	Info_AddChoice (DIA_Addon_Samuel_Stronger, DIALOG_BACK, DIA_Addon_Samuel_Stronger_Back);
	if (Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Doppio Martello di Lou (60 monete d'oro)", DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};		
	if (Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Martello di Lou (30 monete d'oro)", DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice (DIA_Addon_Samuel_Stronger, "Aringa furiosa (30 monete d'oro)", DIA_Addon_Samuel_Stronger_SchnellerHering);	
};

// ************************************************************
// 			  				 Trade 
// ************************************************************
instance DIA_Addon_Samuel_Trade(C_INFO)
{
	npc			= PIR_1351_Addon_Samuel;
	nr			= 8;
	condition	= DIA_Addon_Samuel_Trade_Condition;
	information	= DIA_Addon_Samuel_Trade_Info;
	permanent	= TRUE;
	description	= "Cos'altro hai?";
	Trade		= TRUE;
};                       
FUNC INT DIA_Addon_Samuel_Trade_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Samuel_Trade_Info()
{	
	B_GiveTradeInv (self);

	Npc_RemoveInvItems	(self, ItFo_Addon_Grog, Npc_HasItems (self,ItFo_Addon_Grog) );
	CreateInvItems 	(self, ItFo_Addon_Grog, 15);
	
	AI_Output (other,self ,"DIA_Addon_Samuel_Trade_15_00"); //Cos'altro hai?
	AI_Output (self ,other,"DIA_Addon_Samuel_Trade_14_01"); //Posso darti tutto ciò di cui un pirata ha bisogno.
};

// ************************************************************
// 			  	Was gibt's neues im Lager	(PERM)
// ************************************************************
instance DIA_Addon_Samuel_News(C_INFO)
{
	npc			= PIR_1351_Addon_Samuel;
	nr			= 99;
	condition	= DIA_Addon_Samuel_News_Condition;
	information	= DIA_Addon_Samuel_News_Info;
	permanent	= TRUE;
	description	= "Cose c'è di nuovo al campo?";
};                       
FUNC INT DIA_Addon_Samuel_News_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Samuel_News_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Samuel_News_15_00"); //Novità all'accampamento?
	
	if (Npc_IsDead (Francis))
	|| (Francis_ausgeschissen == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Samuel_News_14_01"); //Francis ha avuto quel che meritava! Non immagini quanto ne sia felice.
		AI_Output (self, other, "DIA_Addon_Samuel_News_14_02"); //Hai proprio ragione. Facciamoci un bicchiere... Offro io!
		if (GregIsBack == TRUE)
		{
			AI_Output (self, other, "DIA_Addon_Samuel_News_14_03"); //E Greg è finalmente tornato. Ha perso la nave, ma almeno riporterà l'ordine nell'accampamento.
		};
	}
	else //Greg noch weg UND Francis lebt noch
	{
		if (!Npc_IsDead (Morgan))
		{
			AI_Output (self ,other,"DIA_Addon_Samuel_News_14_04"); //Da quando Greg se n'è andato qui non è successo granché. Morgan e i suoi ragazzi non fanno altro che oziare e sbronzarsi.
		};
		if (!Npc_IsDead (Henry))
		{
			AI_Output (self ,other,"DIA_Addon_Samuel_News_14_05"); //L'unico che faccia qualcosa è Henry. Lui e i suoi ragazzi stanno costruendo la palizzata.
		};
		AI_Output (self ,other,"DIA_Addon_Samuel_News_14_06"); //Non vedo l'ora che Capitan Greg torni e prenda a calci nel sedere Francis!
	};
};
