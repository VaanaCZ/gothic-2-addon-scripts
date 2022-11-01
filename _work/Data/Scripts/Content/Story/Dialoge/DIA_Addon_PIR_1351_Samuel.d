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
	AI_Output (self ,other, "DIA_Addon_Samuel_Hello_14_00"); //¡Ah, una cara nueva!
	AI_Output (self ,other, "DIA_Addon_Samuel_Hello_14_01"); //¿Qué quieres? ¿Ron o algo más fuerte?
	
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

	description	= "Quiero hablarte de Francis.";
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
	AI_Output (other, self, "DIA_Addon_Samuel_Francis_15_00"); //Quiero hablarte de Francis.
	AI_Output (self, other, "DIA_Addon_Samuel_Francis_14_01"); //¡Pero no menciones a ese Capitán 'quiero y no puedo'! 
	AI_Output (self, other, "DIA_Addon_Samuel_Francis_14_02"); //Se pasa todo el día reposando su enorme culo, haciéndose el importante.
	AI_Output (self, other, "DIA_Addon_Samuel_Francis_14_03"); //¡Ya nos gustaría saber en qué demonios pensaba el Capitán cuando lo dejo al ÉL al mando!
	AI_Output (self, other, "DIA_Addon_Samuel_Francis_14_04"); //¿Qué quieres de ese mojigato?
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

	description	= "Tengo que entrar en la cabaña de Greg.";
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
	AI_Output (other, self, "DIA_Addon_Samuel_Francis_15_02"); //Tengo que entrar en la cabaña de Greg.
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_05"); //(astuto) ¿En serio? ¿Y para qué?
	AI_Output (other, self, "DIA_Addon_Samuel_Francis_15_01"); //Necesito una armadura de bandido.
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_06"); //(ríe) Francis NUNCA te dejará entrar en la cabaña para que le birles unas cuántas cosas a Greg.
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_07"); //A menos que
	AI_Output (other, self,	"DIA_Addon_Samuel_Francis_15_03"); //¿Sí?
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_08"); //…tengas algo que él desee.
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_09"); //Sé que Francis ha escondido algo en una mina abandonada del cañón.
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_10"); //Una vez que estábamos juntos de guardia y se quedó dormido, como siempre, habló de ello en sueños.
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_11"); //No sé qué habrá enterrado allí, pero tal vez sea suficientemente importante para dejarte entrar a la cabaña a cambio de recuperarlo
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_12"); //(feliz) Cuando el Capitán vuelva y vea que le han desaparecido cosas, despellejará vivo a Francis.

	B_LogEntry (TOPIC_Addon_BDTRuestung,"Samuel el destilador mencionó un escondite secreto de Francis en una de las minas del cañón. Quizá encuentre algo allí que me ayude a llegar a la cabaña."); 
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
	description = "¡Tengo una fórmula para ti!";
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
	AI_Output (other,self ,"DIA_Addon_Samuel_Recipe_15_00"); //¡Tengo una fórmula para ti!
	AI_Output (self ,other,"DIA_Addon_Samuel_Recipe_14_01"); //Genial, déjame ver. ¿Qué clase fórmula?
	
	Info_ClearChoices (DIA_Addon_Samuel_Recipe);
	if (Samuel_Knows_LousHammer == FALSE) 
	&& (Npc_HasItems (other, ITWr_Addon_Lou_Rezept) > 0)
	{
		Info_AddChoice (DIA_Addon_Samuel_Recipe,"Martillo de Lou",DIA_Addon_Samuel_Recipe_LousHammer);
	};
	if (Samuel_Knows_SchlafHammer == FALSE)
	&& (Npc_HasItems (other, ITWr_Addon_Lou_Rezept2) > 0)
	{
		Info_AddChoice (DIA_Addon_Samuel_Recipe,"Martillo doble de Lou",DIA_Addon_Samuel_Recipe_LousDoubleHammer);
	};
};
func VOID DIA_Addon_Samuel_Recipe_Back()
{
	Info_ClearChoices (DIA_Addon_Samuel_Recipe);
};
func VOID DIA_Addon_Samuel_Recipe_LousHammer ()
{
	AI_Output (other,self ,"DIA_Addon_Samuel_Recipe_LousHammer_15_00"); //Es de Snaf.
	B_GiveInvItems (other, self, ITWr_Addon_Lou_Rezept, 1);
	B_UseFakeScroll();
	AI_Output (self ,other,"DIA_Addon_Samuel_Recipe_LousHammer_14_04"); //Suena increíble, ¡debo probarla enseguida!
	
	B_GivePlayerXP (XP_Ambient);
	Samuel_Knows_LousHammer = TRUE;
};
func VOID DIA_Addon_Samuel_Recipe_LousDoubleHammer ()
{
	AI_Output (other,self ,"DIA_Addon_Samuel_Recipe_LousDoubleHammer_15_00"); //Cuidado, ¡es absolutamente mortal!
	B_GiveInvItems (other, self, ITWr_Addon_Lou_Rezept2, 1);
	B_UseFakeScroll();
	AI_Output (self ,other,"DIA_Addon_Samuel_Recipe_LousDoubleHammer_14_04"); //Me estás asustando, pero lo pienso probar igual.
	
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
	description = "¡He venido a por mi ración de ponche! (10 oro)";
};                       
FUNC INT DIA_Addon_Samuel_Grog_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Samuel_Grog_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Samuel_Grog_15_00"); //Vengo a por mi ración de ponche.
	if (B_GiveInvItems(other, self, itmi_gold, 10))
	{	
		if (Samuel_Grog_Varianz == 0)
		{
			AI_Output (self,other,"DIA_Addon_Samuel_Grog_14_01"); //Vosotros no hacéis nada sin ponche, ¿eh? Venga, aquí tienes.
			Samuel_Grog_Varianz = 1;
		}
		else if (Samuel_Grog_Varianz == 1)
		{
			AI_Output (self,other,"DIA_Addon_Samuel_Grog_14_02"); //Espero que sea bebible. Me he quedado sin agua fresca. Aunque un poco de agua de mar no le hace daño a nadie, ¿verdad?
			Samuel_Grog_Varianz = 2;
		}
		else // (Samuel_Grog_Varianz == 2)
		{
			AI_Output (self,other,"DIA_Addon_Samuel_Grog_14_03"); //¡Puedes tomar todo el ponche que quieras!
		};
		
		B_GiveInvItems (self,other,ItFo_Addon_Grog,1);
	}
	else //nicht genug Gold
	{
		AI_Output (self,other,"DIA_Addon_Samuel_Grog_14_04"); //¡Lo vendo barato, pero no lo regalo! Primero consigue algo de oro, amigo.
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
	description = "Dame un poco de ron (30 oro)";
};                       
FUNC INT DIA_Addon_Samuel_Rum_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Samuel_Rum_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Samuel_Rum_15_00"); //¡Dame ron!
	
	if (B_GiveInvItems (other,self, ItMi_Gold, 30))
	{
		if (Samuel_Rum_Varianz == 0)
		{
			AI_Output (self ,other,"DIA_Addon_Samuel_Rum_14_01"); //¡Ah! ¡Esto es el néctar de los marineros! ¡Toma!
			Samuel_Rum_Varianz = 1;
		}
		else if (Samuel_Rum_Varianz == 1)
		{
			AI_Output (self ,other,"DIA_Addon_Samuel_Rum_14_02"); //Puede que sepa un poco a pescado. Aquí solo tenemos barriles de arenques. Pero el ron es ron. ¡A tu salud!
			Samuel_Rum_Varianz = 2;
		}
		else // (Samuel_Rum_Varianz == 2)
		{
			AI_Output (self ,other,"DIA_Addon_Samuel_Rum_14_03"); //Aquí tienes.
		};
				
		B_GiveInvItems (self,other,ItFo_Addon_rum,1);
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Samuel_Rum_14_04"); //¡No tienes suficiente oro, amigo! ¿Qué tal algo de ponche?
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
	description = "¡Quiero algo más fuerte!";
};
                       
FUNC INT DIA_Addon_Samuel_Stronger_Condition()
{
	return TRUE;
};

func VOID DIA_Addon_Samuel_Stronger_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Samuel_Stronger_15_00"); //¡Quiero algo más fuerte!
	
	if (Samuel_Stronger_Varianz == 0)
	{
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_01"); //¡Ah, un buscador! Yo también ando siempre buscando fórmulas nuevas.
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_02"); //Un licor en condiciones tiene que ser cristalino y fuerte y quemarte la garganta como fuego líquido.
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_03"); //Y eso no abunda. Pero estoy hablando demasiado. ¡Tú quieres beber!
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_04"); //¡Toma! ¡Es una fórmula propia! ¿Te gusta? Lo llamo el 'arenque veloz'.
		B_GiveInvItems (self,other,ItFo_Addon_Schnellerhering,1);
		B_UseItem (other, ItFo_Addon_Schnellerhering);
		AI_Output (other,self ,"DIA_Addon_Samuel_Stronger_15_05"); //¡Impresionante!
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_06"); //(ríe) ¡Y que lo digas! 
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_07"); //¿No te sabrás una buena fórmula para hacer licor? Si sabes, tienes que decírmela.
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_08"); //¿Quieres otro?
		Samuel_Stronger_Varianz = 1;
	}
	else // (Samuel_Stronger_Varianz == 1)
	{
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_09"); //¿Cómo se llamaba?
	};
	
	Info_ClearChoices (DIA_Addon_Samuel_Stronger);
	Info_AddChoice (DIA_Addon_Samuel_Stronger, DIALOG_BACK, DIA_Addon_Samuel_Stronger_Back);
	if (Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Martillo doble de Lou (60 oro)", DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};		
	if (Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Martillo de Lou (30 oro)", DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice (DIA_Addon_Samuel_Stronger, "Arenque veloz (30 oro)", DIA_Addon_Samuel_Stronger_SchnellerHering);
};
// ------------------------------------------------------------
func void B_Addon_Samuel_NoGold()
{
	AI_Output (self, other, "DIA_Addon_Samuel_NoGold_14_00"); //¡Sin oro, no hay bebida!
};
// ------------------------------------------------------------

func VOID DIA_Addon_Samuel_Stronger_Back()
{
	Info_ClearChoices (DIA_Addon_Samuel_Stronger);
};
func VOID DIA_Addon_Samuel_Stronger_SchnellerHering()
{
	AI_Output (other,self ,"DIA_Addon_Samuel_Stronger_SchnellerHering_15_00"); //Dame un poco de tu arenque veloz.
	if (B_GiveInvItems (other,self, ItMi_Gold, 30))
	{
		AI_Output (self ,other,"DIa_Addon_Samuel_Stronger_SchnellerHering_14_01"); //¡Debería llamarse porquería apestosa, pero es efectivo!
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
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Martillo doble de Lou (60 oro)", DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};		
	if (Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Martillo de Lou (30 oro)", DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice (DIA_Addon_Samuel_Stronger, "Arenque veloz (30 oro)", DIA_Addon_Samuel_Stronger_SchnellerHering);
};
func VOID DIA_Addon_Samuel_Stronger_LousHammer()
{
	AI_Output (other,self ,"DIA_Addon_Samuel_Stronger_LousHammer_15_00"); //¡Quiero un martillo de Lou!
	if (B_GiveInvItems (other, self, ItMi_Gold, 30))
	{
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_LousHammer_14_01"); //¡Estupendo! ¡A refrescar el gaznate!
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
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Martillo doble de Lou (60 oro)", DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};		
	if (Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Martillo de Lou (30 oro)", DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice (DIA_Addon_Samuel_Stronger, "Arenque veloz (30 oro)", DIA_Addon_Samuel_Stronger_SchnellerHering);
};
func VOID DIA_Addon_Samuel_Stronger_LousDoubleHammer()
{
	AI_Output (other,self ,"DIA_Addon_Samuel_Stronger_LousDoubleHammer_15_00"); //(con indiferencia) Dame un doble. Un martillo doble.
	if (B_GiveInvItems (other,self,ItMi_Gold,Value_SchlafHammer))
	{
		if (Samuel_DoppelHammer_Varianz == 0)
		{
			AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_LousDoubleHammer_14_01"); //No hagas nada que puedas lamentar, chico. Espero que no lo pidas para ti.
		}
		else
		{
			AI_Output (self ,other,"DIa_Addon_Samuel_Stronger_LousDoubleHammer_14_02"); //(entusiasmado) ¡Sí! ¡Es lo mejor para reponer fuerzas!
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
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Martillo doble de Lou (60 oro)", DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};		
	if (Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Martillo de Lou (30 oro)", DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice (DIA_Addon_Samuel_Stronger, "Arenque veloz (30 oro)", DIA_Addon_Samuel_Stronger_SchnellerHering);	
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
	description	= "What else have you got?";
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
	
	AI_Output (other,self ,"DIA_Addon_Samuel_Trade_15_00"); //¿Qué más tienes?
	AI_Output (self ,other,"DIA_Addon_Samuel_Trade_14_01"); //Puedo conseguirte todo lo que un pirata necesita para sobrevivir.
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
	description	= "¿Alguna novedad en el campamento?";
};                       
FUNC INT DIA_Addon_Samuel_News_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Samuel_News_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Samuel_News_15_00"); //¿Alguna novedad en el campamento?
	
	if (Npc_IsDead (Francis))
	|| (Francis_ausgeschissen == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Samuel_News_14_01"); //¡Por fin Francis tiene su merecido! Y no sabes todo lo que me alegro.
		AI_Output (self, other, "DIA_Addon_Samuel_News_14_02"); //Tienes razón. Venga, vamos a tomar algo. ¡Yo invito!
		if (GregIsBack == TRUE)
		{
			AI_Output (self, other, "DIA_Addon_Samuel_News_14_03"); //Y Greg por fin ha vuelto. Ha perdido la embarcación, pero al menos restablecerá el orden en el campamento.
		};
	}
	else //Greg noch weg UND Francis lebt noch
	{
		if (!Npc_IsDead (Morgan))
		{
			AI_Output (self ,other,"DIA_Addon_Samuel_News_14_04"); //No ha habido muchas novedades desde que Greg se fue. Morgan y casi todos sus chicos andan todo el día por ahí vagueando.
		};
		if (!Npc_IsDead (Henry))
		{
			AI_Output (self ,other,"DIA_Addon_Samuel_News_14_05"); //El único que hace aquí algo es Henry. ÉL y los suyos están levantando la empalizada.
		};
		AI_Output (self ,other,"DIA_Addon_Samuel_News_14_06"); //¡Ya es hora de que vuelva el Capitán Greg y le dé a ese Francis una buena patada en el culo!
	};
};
