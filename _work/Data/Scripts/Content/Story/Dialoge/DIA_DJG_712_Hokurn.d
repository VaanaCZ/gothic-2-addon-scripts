
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_Hokurn_EXIT   (C_INFO)
{
	npc         = DJG_712_Hokurn;
	nr          = 999;
	condition   = DIA_Hokurn_EXIT_Condition;
	information = DIA_Hokurn_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Hokurn_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Hokurn_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_Hokurn_Hello   (C_INFO)
{
	npc         = DJG_712_Hokurn;
	nr          = 4;
	condition   = DIA_Hokurn_Hello_Condition;
	information = DIA_Hokurn_Hello_Info;
	permanent   = FALSE;
	important 	= TRUE;
};

FUNC INT DIA_Hokurn_Hello_Condition()
{
	if Npc_IsInState (self,ZS_Talk)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Hokurn_Hello_Info()
{
	AI_Output (self ,other,"DIA_Hokurn_Hello_01_00"); //¿Tienes algo de beber?
	AI_Output (other,self ,"DIA_Hokurn_Hello_15_01"); //Supongo que no quieres agua.
	AI_Output (self ,other,"DIA_Hokurn_Hello_01_02"); //¡¡No, maldita sea!! Necesito algo con alcohol para librarme de una vez de estos malditos dolores de cabeza.
	AI_Output (self ,other,"DIA_Hokurn_Hello_01_03"); //Cuando estoy un tiempo sin beber, parece que me va a explotar la cabeza.

	Info_ClearChoices (DIA_Hokurn_Hello);
	Info_AddChoice (DIA_Hokurn_Hello,"Probaré a tomar algo.",DIA_Hokurn_Hello_No);
	
	IF(	(Npc_HasItems (other,ItFo_Beer) 	>=1)	
	||	(Npc_HasItems (other,ItFo_Booze) 	>=1)	
	||	(Npc_HasItems (other,ItFo_Wine) 	>=1))
	{
		Info_AddChoice (DIA_Hokurn_Hello,"Ten, tómate esto.",DIA_Hokurn_Hello_Yes);
	};
};

FUNC VOID DIA_Hokurn_Hello_No ()
{
	AI_Output (other,self ,"DIA_Hokurn_Hello_No_15_00"); //No puedo darte nada.
	AI_Output (self ,other,"DIA_Hokurn_Hello_No_01_01"); //¡Entonces lárgate!

	Info_ClearChoices (DIA_Hokurn_Hello);
	Info_AddChoice (DIA_Hokurn_Hello,DIALOG_ENDE,DIA_Hokurn_Hello_END);
	Info_AddChoice (DIA_Hokurn_Hello,"Una cosa más...",DIA_Hokurn_Hello_ASK1);
};

FUNC VOID DIA_Hokurn_Hello_ASK1 ()
{
	AI_Output (other,self ,"DIA_Hokurn_Hello_ASK1_15_00"); //Una cosa más...
	AI_Output (self ,other,"DIA_Hokurn_Hello_ASK1_01_01"); //(Brama) ¿No entiendes lo que te digo? ¡A TOMAR POR SACO!
	
	Info_ClearChoices (DIA_Hokurn_Hello);
	Info_AddChoice (DIA_Hokurn_Hello,DIALOG_ENDE,DIA_Hokurn_Hello_END);
	Info_AddChoice (DIA_Hokurn_Hello,"Es importante.",DIA_Hokurn_Hello_ASK2);
};

FUNC VOID DIA_Hokurn_Hello_ASK2 ()
{
	AI_Output (other,self ,"DIA_Hokurn_Hello_ASK2_15_00"); //Es importante.
	AI_Output (self ,other,"DIA_Hokurn_Hello_ASK2_01_01"); //(Brama) Tú lo has querido.
	
	AI_StopProcessInfos (self);
	B_Attack (self,other,AR_NONE, 1);
};

FUNC VOID DIA_Hokurn_Hello_END ()
{
	AI_StopProcessInfos (self);
};

FUNC VOID B_Hokurn_Sauf ()
{
	AI_Output (self ,other,"B_Hokurn_Sauf_01_00"); //(Eructa) Ja, me ha sentado fenomenal.
	AI_Output (self ,other,"B_Hokurn_Sauf_01_01"); //Ya vuelvo a pensar con claridad. ¿En qué puedo ayudarte?
};

FUNC VOID DIA_Hokurn_Hello_Yes ()
{
	AI_Output (other,self ,"DIA_Hokurn_Hello_Yes_15_00"); //Ten, tómate esto.
	
	IF		(Npc_HasItems (other,ItFo_Booze) 	>=1)	
	{
		B_GiveInvItems (other,self,ItFo_Booze,1);	
		B_UseItem (self,ItFo_Booze);
	}
	else if	(Npc_HasItems (other,ItFo_Wine) 	>=1)	
	{
		B_GiveInvItems (other,self,ItFo_Wine,1);	
		B_UseItem (self,ItFo_Wine);
	}
	else if	(Npc_HasItems (other,ItFo_Beer) 	>=1)  
	{
		B_GiveInvItems (other,self,ItFo_Beer,1);	
		B_UseItem (self,ItFo_Beer);
	};
	HokurnLastDrink = Wld_GetDay ();
	HokurnGetsDrink = TRUE;
	
	B_Hokurn_Sauf ();
	
	Info_ClearChoices (DIA_Hokurn_Hello);
};

//*********************************************************************
//	Ich hab dir was zu Trinken mitgebracht.
//*********************************************************************
INSTANCE DIA_Hokurn_Drink   (C_INFO)
{
	npc         = DJG_712_Hokurn;
	nr          = 5;
	condition   = DIA_Hokurn_Drink_Condition;
	information = DIA_Hokurn_Drink_Info;
	permanent   = TRUE;
	description = "Te he traído algo de beber.";
};

FUNC INT DIA_Hokurn_Drink_Condition()
{
	if(	(HokurnGetsDrink == FALSE)
	&&(	(Npc_HasItems (other,ItFo_Beer) 	>=1)	
	||	(Npc_HasItems (other,ItFo_Booze) 	>=1)	
	||	(Npc_HasItems (other,ItFo_Wine) 	>=1)))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Hokurn_Drink_Info()
{
	AI_Output (other,self ,"DIA_Hokurn_Drink_15_00"); //Te he traído algo de beber.
	AI_Output (self ,other,"DIA_Hokurn_Drink_01_01"); //(Con avaricia) ¡¡Dámelo!!
	
	IF	(Npc_HasItems (other,ItFo_Booze) 	>=1)	
	{
		B_GiveInvItems (other,self,ItFo_Booze,1);	
		B_UseItem (self,ItFo_Booze);
	}
	else if	(Npc_HasItems (other,ItFo_Wine) 	>=1)	
	{
		B_GiveInvItems (other,self,ItFo_Wine,1);	
		B_UseItem (self,ItFo_Wine);
	}
	else if	(Npc_HasItems (other,ItFo_Beer) 	>=1)  
	{
		B_GiveInvItems (other,self,ItFo_Beer,1);	
		B_UseItem (self,ItFo_Beer);
	};
	HokurnLastDrink = Wld_GetDay ();
	HokurnGetsDrink = TRUE;
	
	B_Hokurn_Sauf ();
};

//*********************************************************************
//	Ich hab da ein paar Fragen.
//*********************************************************************
INSTANCE DIA_Hokurn_Question   (C_INFO)
{
	npc         = DJG_712_Hokurn;
	nr          = 5;
	condition   = DIA_Hokurn_Question_Condition;
	information = DIA_Hokurn_Question_Info;
	permanent   = TRUE;
	description = "Necesito información.";
};

FUNC INT DIA_Hokurn_Question_Condition()
{
	if	(HokurnGetsDrink == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Hokurn_Question_Info()
{
	AI_Output (other,self ,"DIA_Hokurn_Question_15_00"); //Necesito información.
	AI_Output (self ,other,"DIA_Hokurn_Question_01_01"); //(Irritado) Creía que me habías entendido. Solo hablo con amigos.
	AI_Output (self ,other,"DIA_Hokurn_Question_01_02"); //Y los amigos te ofrecen algo de beber. ¿Lo pillas? ¡Lárgate de una vez!
};

//*********************************************************************
//	Ich such jemanden, der mir was beibringen kann.
//*********************************************************************
INSTANCE DIA_Hokurn_Learn   (C_INFO)
{
	npc         = DJG_712_Hokurn;
	nr          = 6;
	condition   = DIA_Hokurn_Learn_Condition;
	information = DIA_Hokurn_Learn_Info;
	permanent   = FALSE;
	description = "Busco a alguien que pueda enseñarme algo.";
};

FUNC INT DIA_Hokurn_Learn_Condition()
{
	if	(HokurnGetsDrink == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Hokurn_Learn_Info()
{
	AI_Output (other,self ,"DIA_Hokurn_Learn_15_00"); //Busco a alguien que pueda enseñarme algo.
	AI_Output (self ,other,"DIA_Hokurn_Learn_01_01"); //Yo podría enseñarte unas cuantas cosas. Soy el mejor combatiente en muchos kilómetros a la redonda.
	AI_Output (self ,other,"DIA_Hokurn_Learn_01_02"); //Como somos amigos, te haré descuento. 300 monedas de oro.

	Info_ClearChoices (DIA_Hokurn_Learn);
	Info_AddChoice	(DIA_Hokurn_Learn,"Es demasiado caro.",DIA_Hokurn_Learn_TooExpensive);
	if (Npc_HasItems (other,ItMi_Gold) >= 300)
	{
		Info_AddChoice	(DIA_Hokurn_Learn,"De acuerdo, aquí tienes el dinero.",DIA_Hokurn_Learn_OK);
	};	 
};

FUNC VOID DIA_Hokurn_Learn_TooExpensive ()
{
	AI_Output (other,self ,"DIA_Hokurn_Learn_TooExpensive_15_00"); //Es demasiado caro.
	AI_Output (self ,other,"DIA_Hokurn_Learn_TooExpensive_01_01"); //¿Demasiado caro? Es menos de lo que cobraría cualquiera que estuviese en mi lugar.
	AI_Output (self ,other,"DIA_Hokurn_Learn_TooExpensive_01_02"); //Piénsatelo.
	
	Info_ClearChoices (DIA_Hokurn_Learn);
};

FUNC VOID DIA_Hokurn_Learn_OK ()
{
	AI_Output (other,self ,"DIA_Hokurn_Learn_OK_15_00"); //De acuerdo, aquí tienes el dinero.
	B_GiveInvItems (other,self,ItMi_Gold,300);
	Hokurn_TeachPlayer = TRUE;
	Info_ClearChoices (DIA_Hokurn_Learn);
};

//*********************************************************************
//	Hier ist dein Geld. Ich will trainieren.
//*********************************************************************
INSTANCE DIA_Hokurn_PayTeacher   (C_INFO)
{
	npc         = DJG_712_Hokurn;
	nr          = 6;
	condition   = DIA_Hokurn_PayTeacher_Condition;
	information = DIA_Hokurn_PayTeacher_Info;
	permanent   = TRUE;
	description = "Ten el dinero. Quiero que me entrenes.";
};

FUNC INT DIA_Hokurn_PayTeacher_Condition()
{
	if	(Npc_KnowsInfo (other,DIA_Hokurn_Learn))
	&&	(Npc_HasItems (other,ItMi_Gold) >= 300)
	&& 	(HoKurn_TeachPlayer == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Hokurn_PayTeacher_Info()
{
	AI_Output (other,self ,"DIA_Hokurn_PayTeacher_15_00"); //Ten el dinero. Quiero que me entrenes.
	AI_Output (self ,other,"DIA_Hokurn_PayTeacher_01_01"); //¡No te arrepentirás!

	B_GiveInvItems (other,self,ItMi_Gold,300);
	Hokurn_TeachPlayer = TRUE;
};

//*********************************************************************
//	Hier ist dein Drink.
//*********************************************************************
INSTANCE DIA_Hokurn_DrinkAndLearn   (C_INFO)
{
	npc         = DJG_712_Hokurn;
	nr          = 7;
	condition   = DIA_Hokurn_DrinkAndLearn_Condition;
	information = DIA_Hokurn_DrinkAndLearn_Info;
	permanent   = TRUE;
	description = "Toma algo de beber.";
};

FUNC INT DIA_Hokurn_DrinkAndLearn_Condition()
{
	if	(HokurnGetsDrink == TRUE)
	&&(	(Npc_HasItems (other,ItFo_Booze) >= 1)
	||	(Npc_HasItems (other,ItFo_Wine) >= 1)
	||	(Npc_HasItems (other,ItFo_Beer) >= 1))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Hokurn_DrinkAndLearn_Info()
{
	AI_Output (other,self ,"DIA_Hokurn_DrinkAndLearn_15_00"); //Toma algo de beber.
	
	IF	(Npc_HasItems (other,ItFo_Booze) 	>=1)	
	{
		B_GiveInvItems (other,self,ItFo_Booze,1);	
		B_UseItem (self,ItFo_Booze);
	}
	else if	(Npc_HasItems (other,ItFo_Wine) 	>=1)	
	{
		B_GiveInvItems (other,self,ItFo_Wine,1);	
		B_UseItem (self,ItFo_Wine);
	}
	else if	(Npc_HasItems (other,ItFo_Beer) 	>=1) 
	{
		B_GiveInvItems (other,self,ItFo_Beer,1);	
		B_UseItem (self,ItFo_Beer);
	};
	
	HokurnLastDrink = Wld_GetDay ();
	
	AI_Output (self ,other,"DIA_Hokurn_DrinkAndLearn_01_01"); //Me siento mucho mejor. Estoy preparado para cualquier cosa.

};

//*********************************************************************
//	Lass uns trainieren!
//*********************************************************************

INSTANCE DIA_Hokurn_Teach(C_INFO)
{
	npc			= DJG_712_Hokurn;
	nr			= 7;
	condition	= DIA_Hokurn_Teach_Condition;
	information	= DIA_Hokurn_Teach_Info;
	permanent	= TRUE;
	description = "Empecemos con el entrenamiento.";
};                       

FUNC INT DIA_Hokurn_Teach_Condition()
{
	IF (Hokurn_Teachplayer == TRUE)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Hokurn_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Hokurn_Teach_15_00"); //Empecemos con el entrenamiento.
	
	if (HokurnLastDrink < Wld_GetDay ())
	{
		AI_Output (self ,other,"DIA_Hokurn_Teach_01_01"); //¡Antes tráeme algo de beber!
	}
	else
	{	 
		if (hero.guild == GIL_PAL)
		{
			AI_Output (self ,other,"DIA_Hokurn_Teach_01_02"); //Luego veremos lo que podemos exprimirle a tus oxidados huesos de paladín.
		}
		else if (hero.guild == GIL_KDF)
		{
			AI_Output (self ,other,"DIA_Hokurn_Teach_01_03"); //¿Y tú qué sabes? Los magos también emplean armas cuerpo a cuerpo.
		};

		Info_ClearChoices 	(DIA_Hokurn_Teach);
		Info_AddChoice 		(DIA_Hokurn_Teach,	DIALOG_BACK		,DIA_Hokurn_Teach_Back);
		Info_AddChoice		(DIA_Hokurn_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Hokurn_Teach_2H_1);
		Info_AddChoice		(DIA_Hokurn_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Hokurn_Teach_2H_5);
		Info_AddChoice		(DIA_Hokurn_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Hokurn_Teach_1H_1);
		Info_AddChoice		(DIA_Hokurn_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Hokurn_Teach_1H_5);
	};
};

FUNC VOID DIA_Hokurn_Teach_Back ()
{
	Info_ClearChoices (DIA_Hokurn_Teach);
};
FUNC VOID B_Hokurn_TeachedEnough ()
{
	AI_Output(self,other,"B_Hokurn_TeachedEnough_01_00"); //Ya no necesitas un tutor en esta materia.
};

FUNC VOID DIA_Hokurn_Teach_2H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 100);
	
	if (other.HitChance[NPC_TALENT_2H] >= 100)
	{
		B_Hokurn_TeachedEnough ();
	};
	Info_AddChoice		(DIA_Hokurn_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Hokurn_Teach_2H_1);	
};

FUNC VOID DIA_Hokurn_Teach_2H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 100);
	
	if (other.HitChance[NPC_TALENT_2H] >= 100)
	{
		B_Hokurn_TeachedEnough ();
	};
	Info_AddChoice		(DIA_Hokurn_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))	,DIA_Hokurn_Teach_2H_5);	
};

FUNC VOID DIA_Hokurn_Teach_1H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 100);
	
	if (other.HitChance[NPC_TALENT_1H] >= 100)
	{
		B_Hokurn_TeachedEnough ();
	};
	Info_AddChoice		(DIA_Hokurn_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Hokurn_Teach_1H_1);	
};

FUNC VOID DIA_Hokurn_Teach_1H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 100);
	
	if (other.HitChance[NPC_TALENT_1H] >= 100)
	{
		B_Hokurn_TeachedEnough ();
	};
	Info_AddChoice		(DIA_Hokurn_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)) ,DIA_Hokurn_Teach_1H_5);	
};

//*********************************************************************
//	Wieso hängt ihr hier überhaupt rum?
//*********************************************************************
INSTANCE DIA_Hokurn_StayHere   (C_INFO)
{
	npc         = DJG_712_Hokurn;
	nr          = 5;
	condition   = DIA_Hokurn_StayHere_Condition;
	information = DIA_Hokurn_StayHere_Info;
	permanent   = FALSE;
	description = "De todas formas, ¿qué haces aquí?";
};

FUNC INT DIA_Hokurn_StayHere_Condition()
{
	if	(HokurnGetsDrink == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Hokurn_StayHere_Info()
{
	AI_Output (other,self ,"DIA_Hokurn_StayHere_15_00"); //De todas formas, ¿qué haces aquí?
	AI_Output (self ,other,"DIA_Hokurn_StayHere_01_01"); //No tengo ni idea de lo que hacemos aquí o cuándo va a pasar algo.
	AI_Output (self ,other,"DIA_Hokurn_StayHere_01_02"); //Y me da igual, mientras tenga suficiente bebida.
	
	/*
	AI_Output (other,self ,"DIA_Addon_Hokurn_StayHere_15_00"); //Was wollt ihr hier überhaupt?
	AI_Output (self ,other,"DIA_Addon_Hokurn_StayHere_01_01"); //Keine Ahnung, was wir hier machen oder wann es los geht.
	AI_Output (self ,other,"DIA_Addon_Hokurn_StayHere_01_02"); //Ist mir auch egal, solange ich genug zu trinken habe.
	*/
	
};

//*********************************************************************
//	Wisst ihr denn, wo die Drachen sind.
//*********************************************************************
INSTANCE DIA_Hokurn_WhereDragon   (C_INFO)
{
	npc         = DJG_712_Hokurn;
	nr          = 5;
	condition   = DIA_Hokurn_WhereDragon_Condition;
	information = DIA_Hokurn_WhereDragon_Info;
	permanent   = TRUE;
	description = "Entonces, ¿sabes dónde están los dragones?";
};

FUNC INT DIA_Hokurn_WhereDragon_Condition()
{
	if	(HokurnGetsDrink == TRUE)
	&& 	(HokurnTellsDragon == FALSE)
	&&	(Npc_KnowsInfo (other,DIA_Hokurn_StayHere))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Hokurn_WhereDragon_Info()
{
	AI_Output (other,self ,"DIA_Hokurn_WhereDragon_15_00"); //Entonces, ¿sabes dónde están los dragones?
	AI_Output (self ,other,"DIA_Hokurn_WhereDragon_01_01"); //Si te lo digo, ¿qué beneficio saco?

	Info_ClearChoices (DIA_Hokurn_WhereDragon);
	Info_AddChoice (DIA_Hokurn_WhereDragon,"Nada, los buscaré por mi cuenta.",DIA_Hokurn_WhereDragon_FindMyself);
	Info_AddChoice (DIA_Hokurn_WhereDragon,"Estaría dispuesto a pagar por esa información.",DIA_Hokurn_WhereDragon_Gold);
	if Npc_HasItems (other,ITFO_BOOZE) >=1
	{
		Info_AddChoice (DIA_Hokurn_WhereDragon,"¡Aún me queda una botella de ginebra!",DIA_Hokurn_WhereDragon_Booze);	 
	};
};

FUNC VOID DIA_Hokurn_WhereDragon_FindMyself ()
{
	AI_Output (other,self ,"DIA_Hokurn_WhereDragon_FindMyself_15_00"); //Nada, los buscaré por mi cuenta.
	AI_Output (self ,other,"DIA_Hokurn_WhereDragon_FindMyself_01_01"); //Será mejor que tengas cuidado. Te enfrentas a un reto monumental.
	Info_ClearChoices (DIA_Hokurn_WhereDragon);
};

FUNC VOID DIA_Hokurn_WhereDragon_Gold ()
{
	AI_Output (other,self ,"DIA_Hokurn_WhereDragon_Gold_15_00"); //Estaría dispuesto a pagar por esa información.
	AI_Output (self ,other,"DIA_Hokurn_WhereDragon_Gold_01_01"); //¿A pagarme? Um. Te lo contaré por 200 monedas de oro.
	
	Info_ClearChoices (DIA_Hokurn_WhereDragon);
	Info_AddChoice (DIA_Hokurn_WhereDragon,"¡Es demasiado!",DIA_Hokurn_WhereDragon_TooMuch);
	if Npc_HasItems (other,ItMi_Gold) >=200
	{
		Info_AddChoice (DIA_Hokurn_WhereDragon,"Trato hecho. ¡Aquí tienes el dinero!",DIA_Hokurn_WhereDragon_OK);
	};
};

FUNC VOID DIA_Hokurn_WhereDragon_TooMuch ()
{
	AI_Output	(other,self ,"DIA_Hokurn_WhereDragon_TooMuch_15_00"); //¡Es demasiado!
	AI_Output 	(self ,other,"DIA_Hokurn_WhereDragon_TooMuch_01_01"); //Entonces no hay nada que hacer.
	Info_ClearChoices	(DIA_Hokurn_WhereDragon); 
};

FUNC VOID DIA_Hokurn_WhereDragon_OK ()
{
	AI_Output (other,self ,"DIA_Hokurn_WhereDragon_OK_15_00"); //Trato hecho. ¡Aquí tienes el dinero!
	B_GiveInvItems (other,self,ItMi_gold,200);
	
	HokurnTellsDragon = TRUE;
	Info_ClearChoices (DIA_Hokurn_WhereDragon);
};

FUNC VOID DIA_Hokurn_WhereDragon_Booze ()
{
	AI_Output (other,self ,"DIA_Hokurn_WhereDragon_Booze_15_00"); //¡Aún me queda una botella de ginebra!
	AI_Output (self ,other,"DIA_Hokurn_WhereDragon_Booze_01_01"); //Me pelearía con todos los dragones del mundo por una botella de buena cosecha.
	AI_Output (self ,other,"DIA_Hokurn_WhereDragon_Booze_01_02"); //De acuerdo. ¡Dame la botella!
	B_GiveInvItems ( other,self,ItFo_booze,1);
	AI_Output (self ,other,"DIA_Hokurn_WhereDragon_Booze_01_03"); //La guardaré para un día lluvioso.

	HokurnTellsDragon = TRUE;
	Info_ClearChoices (DIA_Hokurn_WhereDragon);
};

//*********************************************************************
//	Also, wo sind jetzt die Drachen?
//*********************************************************************
INSTANCE DIA_Hokurn_Dragon   (C_INFO)
{
	npc         = DJG_712_Hokurn;
	nr          = 5;
	condition   = DIA_Hokurn_Dragon_Condition;
	information = DIA_Hokurn_Dragon_Info;
	permanent   = TRUE;
	description = "De acuerdo. ¿Dónde están esos dragones?";
};

FUNC INT DIA_Hokurn_Dragon_Condition()
{
	if	(HokurnTellsDragon == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Hokurn_Dragon_Info()
{
	AI_Output (other,self ,"DIA_Hokurn_Dragon_15_00"); //De acuerdo. ¿Dónde están esos dragones?
	AI_Output (self ,other,"DIA_Hokurn_Dragon_01_01"); //Por supuesto, no puedo darte detalles concretos, pero he oído que se supone que hay cuatro dragones.
	AI_Output (self ,other,"DIA_Hokurn_Dragon_01_02"); //Por la noche hemos visto un fulgor rojizo en la cumbre de la montaña más alta.
	AI_Output (self ,other,"DIA_Hokurn_Dragon_01_03"); //Te juro por mi madre que, si buscas un dragón, allí lo encontrarás.
};

//*********************************************************************
//	AllDragonsDead 
//*********************************************************************
INSTANCE DIA_Hokurn_AllDragonsDead   (C_INFO)
{
	npc         = DJG_712_Hokurn;
	nr          = 5;
	condition   = DIA_Hokurn_AllDragonsDead_Condition;
	information = DIA_Hokurn_AllDragonsDead_Info;
	permanent   = TRUE;
	description	= "He matado a todos los dragones.";
				
};

FUNC INT DIA_Hokurn_AllDragonsDead_Condition()
{
	if (MIS_AllDragonsDead == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Hokurn_AllDragonsDead_Info()
{
	AI_Output	(other,self ,"DIA_Hokurn_AllDragonsDead_15_00"); //He matado a todos los dragones.
	AI_Output 	(self ,other,"DIA_Hokurn_AllDragonsDead_01_01"); //Vete a freír espárragos y a contarle esos cuentos a otro.
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Hokurn_PICKPOCKET (C_INFO)
{
	npc			= DJG_712_Hokurn;
	nr			= 900;
	condition	= DIA_Hokurn_PICKPOCKET_Condition;
	information	= DIA_Hokurn_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Hokurn_PICKPOCKET_Condition()
{
	C_Beklauen (69, 210);
};
 
FUNC VOID DIA_Hokurn_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Hokurn_PICKPOCKET);
	Info_AddChoice		(DIA_Hokurn_PICKPOCKET, DIALOG_BACK 		,DIA_Hokurn_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Hokurn_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Hokurn_PICKPOCKET_DoIt);
};

func void DIA_Hokurn_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Hokurn_PICKPOCKET);
};
	
func void DIA_Hokurn_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Hokurn_PICKPOCKET);
};



