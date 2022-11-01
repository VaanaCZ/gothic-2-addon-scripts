// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Francis_EXIT(C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 999;
	condition	= DIA_Addon_Francis_EXIT_Condition;
	information	= DIA_Addon_Francis_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Francis_EXIT_Condition()
{
	if (GregIsBack == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Francis_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  			In Gregs Hütte rein 
// ************************************************************
// ------------------------------------------------------------
// 			  		Spieler kennt Hütte nicht
// ------------------------------------------------------------
INSTANCE DIA_Addon_Francis_First (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 1;
	condition	= DIA_Addon_Francis_First_Condition;
	information	= DIA_Addon_Francis_First_Info;
	permanent	= FALSE;
	description = "¿Esta es tu cabaña?";
};                       
FUNC INT DIA_Addon_Francis_First_Condition()
{
	if (Knows_GregsHut == FALSE)
	&& (Francis_ausgeschissen == FALSE)
	&& (Npc_HasItems (self, ITKE_Greg_ADDON_MIS))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_First_Info()
{	
	AI_Output (other,self,"DIA_Addon_Francis_GregsHut_15_00"); //¿Esta es tu cabaña?
	AI_Output (self,other,"DIA_Addon_Francis_GregsHut_13_01"); //No, es de Greg.
	Knows_GregsHut = TRUE;
};
// ------------------------------------------------------------
// 			  			Ich muß da rein!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Francis_LetMeIn (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 2;
	condition	= DIA_Addon_Francis_LetMeIn_Condition;
	information	= DIA_Addon_Francis_LetMeIn_Info;
	permanent	= FALSE;
	description = "Tengo que entrar en la cabaña de Greg.";
};                       
FUNC INT DIA_Addon_Francis_LetMeIn_Condition()
{
	if ( (Npc_KnowsInfo (other, DIA_Addon_Francis_First)) || (Knows_GregsHut == TRUE) )
	&& (Francis_ausgeschissen == FALSE)
	&& (Npc_HasItems (self, ITKE_Greg_ADDON_MIS))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_LetMeIn_Info()
{	
	AI_Output (other, self ,"DIA_Addon_Francis_LetMeIn_15_00"); //¡Tengo que entrar en la cabaña de Greg!
	AI_Output (self ,other ,"DIA_Addon_Francis_LetMeIn_13_01"); //¡Ni lo sueñes!
	AI_Output (self ,other ,"DIA_Addon_Francis_LetMeIn_13_02"); //Greg no está. Y yo he cerrado la puerta y me ocupo de que nadie husmee por aquí para saquearlo. 
	AI_Output (self ,other ,"DIA_Addon_Francis_LetMeIn_13_03"); //¡Así que esfúmate o te las verás conmigo!
};
// ------------------------------------------------------------
// 			  			Hab Greg getroffen!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Francis_AboutGreg (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 3;
	condition	= DIA_Addon_Francis_AboutGreg_Condition;
	information	= DIA_Addon_Francis_AboutGreg_Info;
	permanent	= FALSE;
	description = "¿Greg es tu jefe?";
};                       
FUNC INT DIA_Addon_Francis_AboutGreg_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Francis_LetMeIn))
	&& (Francis_ausgeschissen == FALSE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_AboutGreg_Info()
{	
	AI_Output (other, self ,"DIA_Addon_Francis_AboutGreg_15_00"); //¿Greg es tu jefe?
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_01"); //¡Ahora no me vengas con que lo conoces!
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_02"); //¡Cualquier marinero o lobo de mar de esta isla conoce al terrible Capitán Greg!
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_03"); //(orgulloso) ¡Y ME ha dejado al cargo!
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_04"); //¡Soy el responsable de hacer que esos holgazanes cumplan sus órdenes!
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_05"); //Algunos pensarán que pueden hacer lo que les salga de las narices ahora que el Capitán no está.
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_06"); //Pero se van a llevar una sorpresa cuando Greg vuelva. 
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_07"); //Le contaré todo lo que ha ocurrido, ¿entendido?
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_08"); //Y también que alguien ha intentado entrar en su cabaña.
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_09"); //Así que esfúmate o te meterás en líos.
};
// ------------------------------------------------------------
// 		  			Gib mir Schlüssel + Bestechung!
// ------------------------------------------------------------
var int Francis_bezahlt;

INSTANCE DIA_Addon_Francis_Key (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 4;
	condition	= DIA_Addon_Francis_Key_Condition;
	information	= DIA_Addon_Francis_Key_Info;
	permanent	= TRUE;
	description = "¡Dame la llave de la cabaña de Greg!";
};                       
FUNC INT DIA_Addon_Francis_Key_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Francis_LetMeIn))
	&& (Npc_HasItems (self, ITKE_Greg_ADDON_MIS))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_Key_Info()
{	
	AI_Output (other, self,"DIA_Addon_Francis_Key_15_00"); //¡Dame la llave de la cabaña de Greg!
	AI_Output (self ,other,"DIA_Addon_Francis_Key_13_01"); //¡Debes de estar de guasa!
	
	Info_ClearChoices (DIA_Addon_Francis_Key);
	Info_AddChoice (DIA_Addon_Francis_Key, "Me lo pensaré…", DIA_Addon_Francis_Key_BACK);
	Info_AddChoice (DIA_Addon_Francis_Key, "¡Te daré 2000 monedas de oro!", DIA_Addon_Francis_Key_2000Gold);
	Info_AddChoice (DIA_Addon_Francis_Key, "¡Te daré 1000 monedas de oro!", DIA_Addon_Francis_Key_1000Gold);
};
func void DIA_Addon_Francis_Key_BACK()
{
	Info_ClearChoices (DIA_Addon_Francis_Key);
};
func void DIA_Addon_Francis_Key_1000Gold()
{
	AI_Output (other, self ,"DIA_Addon_Francis_Key_1000Gold_15_00"); //¡Te daré 1000 monedas de oro!
	AI_Output (self ,other ,"DIA_Addon_Francis_Key_1000Gold_13_01"); //No es suficiente para que traicione a mi Capitán, lo siento.
	AI_Output (self ,other ,"DIA_Addon_Francis_Key_1000Gold_13_02"); //¡Cuidado con lo que dices o te despellejo vivo!
};
func void DIA_Addon_Francis_Key_2000Gold()
{
	AI_Output (other,self ,"DIA_Addon_Francis_Key_2000Gold_15_00"); //¡Te daré 2000 monedas de oro!
	
	if (Npc_HasItems (other,ItMI_Gold) >= 2000)
	{
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_01"); //Amigo, me pides que me amotine.
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_02"); //(para sí) Aunque, pensándolo bien
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_03"); //Oh, venga, dame el dinero. Nadie tiene por qué enterarse.
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_04"); //¡Toma la llave!
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_05"); //Date prisa, antes de que Greg vuelva. Y ni una palabra al resto, ¿¡entendido!?
		B_GiveInvItems (other, self,ItMi_Gold,2000);
		B_GiveInvItems (self ,other,ITKE_Greg_ADDON_MIS,1);
		Francis_bezahlt = TRUE;
	}
	else 
	{
		AI_Output (self ,other,"DIA_Addon_FrancisNotEnoughGold_13_05"); //(ríe) ¡Ja! ¡Apuesto a que no tienes tanto!
	};
	Info_ClearChoices (DIA_Addon_Francis_Key);
};
// ------------------------------------------------------------
// 			  				Aufs Maul!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Francis_AufsMaul (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 5;
	condition	= DIA_Addon_Francis_AufsMaul_Condition;
	information	= DIA_Addon_Francis_AufsMaul_Info;
	permanent	= TRUE;
	description = "A ver si tienes lo que hay que tener.";
};                       
FUNC INT DIA_Addon_Francis_AufsMaul_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Francis_LetMeIn))
	&& (Npc_HasItems (self, ITKE_Greg_ADDON_MIS))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_AufsMaul_Info()
{	
	AI_Output (other, self, "DIA_Addon_Francis_AufsMaul_15_00"); //Bien, pues veamos lo que tienes.
	AI_Output (self, other, "DIA_Addon_Francis_AufsMaul_13_01"); //(estridente) ¿Qué? ¡Yo soy aquí el Capitán! 
	AI_Output (self, other, "DIA_Addon_Francis_AufsMaul_13_02"); //¡Te enseñaré lo que es respeto, lobo de mar!
	
	AI_StopProcessInfos (self);
	B_Attack(self, other, AR_NONE, 1);
};
// ------------------------------------------------------------
// 			  		Ich habe dein Versteck gefunden...
// ------------------------------------------------------------
INSTANCE DIA_Addon_Francis_Buch (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 5;
	condition	= DIA_Addon_Francis_Buch_Condition;
	information	= DIA_Addon_Francis_Buch_Info;
	permanent	= TRUE;
	description = "He encontrado tu alijo…";
};                       
FUNC INT DIA_Addon_Francis_Buch_Condition()
{
	if (Npc_HasItems (other, ITWR_Addon_FrancisAbrechnung_Mis))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_Buch_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Francis_Key_Business_15_03"); //He encontrado tu escondite. Tu tesoro y tu libro de pagos. Este es tu libro, ¿verdad?
	AI_Output (self, other, "DIA_Addon_Francis_Buch_13_01"); //Emm… Es la primer vez que lo veo.
	AI_Output (self, other, "DIA_Addon_Francis_Buch_13_02"); //Y… Estooo… aunque FUERA mi libro
	AI_Output (self, other, "DIA_Addon_Francis_Buch_13_03"); //No pensarás EN SERIO que los chicos creerán tu HISTORIA basada en unas hojas amarillentas, ¿verdad?
	AI_Output (other,self ,"DIA_Addon_Francis_Key_Business_15_01"); //Los has estafado la parte que les correspondía.
	AI_Output (self, other, "DIA_Addon_Francis_Buch_13_04"); //Emm… un segundo
	if (Npc_HasItems (self, ITKE_Greg_ADDON_MIS))
	{
		if (Npc_KnowsInfo (other, DIA_Addon_Francis_LetMeIn))
		{
			AI_Output (self, other, "DIA_Addon_Francis_Buch_13_05"); //(falso) ¿No querías la llave de la cabaña de Greg?
		};
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_06"); //Te DARÉ la llave de la cabaña de Greg.
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_07"); //Hay cosas de mucho valor dentro
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_08"); //(nervioso) Pero tú me darás el libro y cerrarás bien el pico, ¿de acuerdo?
		B_GiveInvItems (other,self,ITWR_Addon_FrancisAbrechnung_Mis,1);
		B_GiveInvItems (self ,other,ITKE_Greg_ADDON_MIS,1);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_09"); //¡No hagas ninguna estupidez!
		if (Francis_bezahlt == TRUE)
		&& (Npc_HasItems(self, itmi_gold) >= 2000)
		{
			AI_Output (self, other, "DIA_Addon_Francis_Buch_13_10"); //¡Aquí tienes tus 2000 monedas de oro!
			AI_Output (self, other, "DIA_Addon_Francis_Buch_13_11"); //¡Y añado otras 500!
			B_GiveInvItems (self, other, itmi_gold, 2500);
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_Francis_Buch_13_12"); //¡Toma, 500 monedas de oro!
			B_GiveInvItems (self, other, itmi_gold, 500);
		};
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_13"); //(con prisa) Y ahora, dame eso
		B_GiveInvItems (other,self,ITWR_Addon_FrancisAbrechnung_Mis,1);
	};
	AI_StopProcessInfos (self);
};

// ------------------------------------------------------------
// 			  				PICK POCKET
// ------------------------------------------------------------
instance DIA_Francis_PICKPOCKET (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 900;
	condition	= DIA_Francis_PICKPOCKET_Condition;
	information	= DIA_Francis_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Sería sencillo robar su llave)";
};                       
func INT DIA_Francis_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems (self, ITKE_Greg_ADDON_MIS) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (40 - Theftdiff))
	{
		return TRUE;
	};
};
func VOID DIA_Francis_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Francis_PICKPOCKET);
	Info_AddChoice		(DIA_Francis_PICKPOCKET, DIALOG_BACK 		,DIA_Francis_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Francis_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Francis_PICKPOCKET_DoIt);
};
func void DIA_Francis_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 40)
	{
		B_GiveInvItems (self,other , ITKE_Greg_ADDON_MIS, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GivePlayerXP (XP_Ambient);
		Info_ClearChoices (DIA_Francis_PICKPOCKET);
	}
	else
	{
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //AR_Theft führt zu NEWS!
	};
	Info_ClearChoices (DIA_Francis_PICKPOCKET);
};
func void DIA_Francis_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Francis_PICKPOCKET);
};


// ************************************************************
// 			  		Wenn von Greg weggeschickt 
// ************************************************************
instance DIA_Francis_Ausgeschissen (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 900;
	condition	= DIA_Francis_Ausgeschissen_Condition;
	information	= DIA_Francis_Ausgeschissen_Info;
	permanent	= TRUE;
	important 	= TRUE;
};                       
func INT DIA_Francis_Ausgeschissen_Condition()
{
	if (Francis_ausgeschissen == TRUE)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};
func VOID DIA_Francis_Ausgeschissen_Info()
{	
	if (!Npc_IsDead(Greg))
	{
		AI_Output (self, other, "DIA_Addon_Francis_Ausgeschissen_13_00"); //(furioso) Gracias a ti, Greg me va a hacer cortar tablas hasta que no queden árboles en la isla.
	};
	AI_Output (self, other, "DIA_Addon_Francis_Ausgeschissen_13_01"); //¡Déjame en paz!
	AI_StopProcessInfos (self);
};


