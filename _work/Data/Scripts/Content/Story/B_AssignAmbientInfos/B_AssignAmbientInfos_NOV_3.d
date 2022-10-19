// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_NOV_3_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_NOV_3_EXIT_Condition;
	information	= DIA_NOV_3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_NOV_3_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// *************************************************************************
// 		Fegen
// *************************************************************************
INSTANCE DIA_NOV_3_Fegen(C_INFO)
{
	nr			= 2;
	condition	= DIA_NOV_3_Fegen_Condition;
	information	= DIA_NOV_3_Fegen_Info;
	permanent	= TRUE;
	description = "Necesito ayuda para peinar las estancias de los novicios.";
};                       
//------------------------------------
var int Feger1_Permanent; 
var int Feger2_Permanent;
//------------------------------------
FUNC INT DIA_NOV_3_Fegen_Condition()
{
	if (Kapitel == 1)
	&& (MIS_KlosterArbeit == LOG_RUNNING)
	&& (NOV_Helfer < 4)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NOV_3_Fegen_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_Fegen_15_00"); //Necesito ayuda para barrer las alcobas de los novicios.
	
	//---------------------------Novize 615 im Keller-----------------------------------------------------------------
	if (Hlp_GetInstanceID (Feger1)  == Hlp_GetInstanceID (self))
	{
		if (NOV_Helfer < 1)
		&& (Feger1_Permanent == FALSE)
		{
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_01"); //No has conseguido que nadie te ayude, ¿eh? Te ayudaré si encuentras a otra persona más que nos eche una mano.
			
			B_LogEntry 	(Topic_ParlanFegen,"El novicio que barre el sótano me ayudará si puedo encontrar otro novicio dispuesto a echarle una mano en la limpieza de las cámaras.");
		}
		else if  (NOV_Helfer >= 1)
		&& (Feger1_Permanent == FALSE)
		{	
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_02"); //¿Soy el único que va a ayudarte?
			AI_Output (other, self, "DIA_NOV_3_Fegen_15_03"); //No, ya cuento con más ayuda.
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_04"); //Entonces, cuenta conmigo.
			NOV_Helfer = (NOV_Helfer +1);
			Feger1_Permanent = TRUE;
			B_GivePlayerXP (XP_Feger);
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine (self,"FEGEN");
			
			B_LogEntry 	(Topic_ParlanFegen,"El novicio del sótano me ayudará a barrer el resto de las cámaras.");
		}
		else if (Feger1_Permanent == TRUE)
		{
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_05"); //Eh, hermano, ya te estoy ayudando. No me tienes que convencer.
		};
	};
	//----------------------------Novize 611 steht draussen rum ----------------------------------------------------------------
	
	if (Hlp_GetInstanceID (Feger2) ==  Hlp_GetInstanceID (self))
	{	
		if (Feger2_Permanent == FALSE)
		{
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_08"); //Claro que te ayudaré. Los novicios tenemos que apoyarnos los unos a los otros. Una mano lava la otra.
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_09"); //Solo necesito 50 monedas de oro porque todavía tengo que pagar a Parlan.
			
			B_LogEntry 	(Topic_ParlanFegen,"El novicio de fuera de la iglesia me ayudará si le doy 50 monedas de oro.");
			
			Info_ClearChoices  (DIA_NOV_3_Fegen);
			Info_AddChoice (DIA_NOV_3_Fegen,"A lo mejor más tarde...",DIA_NOV_3_Fegen_Nein);
			
			if (Npc_HasItems (other, ItMi_Gold) >= 50)
			{
				Info_AddChoice (DIA_NOV_3_Fegen,"De acuerdo. Pagaré.",DIA_NOV_3_Fegen_Ja);
			};
		}
		else //if (Feger2_Permanent == TRUE)
		{
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_06"); //Pero te lo prometí. Tú ya me ayudaste y yo te ayudaré.
		};
	};	
		//------------------------------------ alle anderen Novizen mit Stimme 3 --------------------------------------------------------
		
	if (Hlp_GetInstanceID (Feger1) !=  Hlp_GetInstanceID (self)) 
	&& (Hlp_GetInstanceID (Feger2) !=  Hlp_GetInstanceID (self)) 
	{	
		AI_Output (self, other, "DIA_NOV_3_Fegen_03_07"); //Olvídalo, no tengo tiempo. Busca a otro para que te ayude.
	};
};


FUNC VOID DIA_NOV_3_Fegen_Nein()
{
	AI_Output (other, self, "DIA_NOV_3_Fegen_Nein_15_00"); //Tal vez más adelante. Ahora mismo no puedo permitírmelo.
	Info_ClearChoices  (DIA_NOV_3_Fegen);
};
FUNC VOID DIA_NOV_3_Fegen_Ja()
{
	AI_Output (other, self, "DIA_NOV_3_Fegen_Ja_15_00"); //De acuerdo. Pagaré.
	AI_Output (self, other, "DIA_NOV_3_Fegen_Ja_03_01"); //Bien, entonces me pondré manos a la obra.
	
	B_GiveInvItems (other,self,ItMi_Gold,50);
	NOV_Helfer = (NOV_Helfer +1);
	B_GivePlayerXP (XP_Feger);
	Feger2_Permanent = TRUE;
	Info_ClearChoices  (DIA_NOV_3_Fegen);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"FEGEN");
	
	B_LogEntry 	(Topic_ParlanFegen,"El novicio de fuera de la iglesia me ayudará ahora a barrer las cámaras.");
	
	
};
// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_NOV_3_Wurst(C_INFO)
{
	nr			= 3;
	condition	= DIA_NOV_3_Wurst_Condition;
	information	= DIA_NOV_3_Wurst_Info;
	permanent	= TRUE;
	description = "¿Te apetece algo de embutido?";
};                       

FUNC INT DIA_NOV_3_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NOV_3_Wurst_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_Wurst_15_00"); //¿Te apetece algo de embutido?
	AI_Output (self, other, "DIA_NOV_3_Wurst_03_01"); //Claro, dámela. Una salchicha así no es para hacerle ascos.
	
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben +1);
	
	CreateInvItems (self, ITFO_Sausage,1);
	B_UseItem (self, ITFO_Sausage);
	
	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString (13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen	(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
};
// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_NOV_3_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_NOV_3_JOIN_Condition;
	information	= DIA_NOV_3_JOIN_Info;
	permanent	= TRUE;
	description = "¡Quiero hacerme mago!";
};                       

FUNC INT DIA_NOV_3_JOIN_Condition()
{
	if (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NOV_3_JOIN_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_JOIN_15_00"); //¡Quiero hacerme mago!
	AI_Output (self, other, "DIA_NOV_3_JOIN_03_01"); //Eso es lo que quieren muchos de los novicios, pero solo poquísimos son ordenados como elegidos y tienen la oportunidad de ser aceptados en el Círculo de Fuego.
	AI_Output (self, other, "DIA_NOV_3_JOIN_03_02"); //Ser mago del Círculo del Fuego es el mayor honor al que puedes aspirar en nuestra orden.
	AI_Output (self, other, "DIA_NOV_3_JOIN_03_03"); //Si quieres optar a ello, tendrás que esforzarte.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_NOV_3_PEOPLE(C_INFO)
{
	nr			= 5;
	condition	= DIA_NOV_3_PEOPLE_Condition;
	information	= DIA_NOV_3_PEOPLE_Info;
	permanent	= TRUE;
	description = "¿Quién es el líder de este monasterio?";
};                       

FUNC INT DIA_NOV_3_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_3_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_PEOPLE_15_00"); //¿Quién es el líder de este monasterio?
	AI_Output (self, other, "DIA_NOV_3_PEOPLE_03_01"); //Los novicios servimos a los magos del Círculo de Fuego, que a su vez están a las órdenes del Concilio Supremo, un consejo compuesto de los tres magos más poderosos.
	AI_Output (self, other, "DIA_NOV_3_PEOPLE_03_02"); //Pero Parlan es el responsable de todo lo relacionado con los novicios. Siempre está en el patio supervisando el trabajo de los novicios.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_NOV_3_LOCATION(C_INFO)
{
	nr			= 6;
	condition	= DIA_NOV_3_LOCATION_Condition;
	information	= DIA_NOV_3_LOCATION_Info;
	permanent	= TRUE;
	description = "¿Qué puedes contarme de este monasterio?";
};                       

FUNC INT DIA_NOV_3_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_3_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_LOCATION_15_00"); //¿Qué puedes contarme de este monasterio?
	AI_Output (self, other, "DIA_NOV_3_LOCATION_03_01"); //Nos dedicamos a producir nuestras modestas provisiones. Criamos ovejas y hacemos vino.
	AI_Output (self, other, "DIA_NOV_3_LOCATION_03_02"); //Hay una biblioteca, pero solo la pueden usar los magos y los novicios elegidos.
	AI_Output (self, other, "DIA_NOV_3_LOCATION_03_03"); //Fundamentalmente, los demás novicios atendemos a los magos del Círculo de Fuego a cambio de nada.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_NOV_3_STANDARD(C_INFO)
{
	nr			= 10;
	condition	= DIA_NOV_3_STANDARD_Condition;
	information	= DIA_NOV_3_STANDARD_Info;
	permanent	= TRUE;
	description = "¿Qué hay de nuevo?";
};                       
func INT DIA_NOV_3_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_NOV_3_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_STANDARD_15_00"); //¿Qué hay de nuevo?
		
	if (Kapitel == 1)
	{
		if (hero.guild == GIL_KDF)
		{
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_01"); //¿Y tú lo preguntas? Los novicios no hacen mas que hablar de ti.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_02"); //Es bastante raro que un recién llegado como tú ingrese en el Círculo de Fuego.
		}
		else
		{
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_03"); //De nuevo ha llegado la hora. Dentro de poco, uno de los novicios ingresará en el Círculo de Fuego.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_04"); //Las pruebas comenzarán enseguida.
		};
	};

	if (Kapitel == 2)
	|| (Kapitel == 3)
	{
		if (Pedro_Traitor == TRUE)
		&& (MIS_NovizenChase != LOG_SUCCESS)	//Kap 3b - SC weiss, das Pedro das Auge Innos geklaut hat
		{
	 		AI_Output (self,other,"DIA_NOV_3_STANDARD_03_05"); //¡Beliar ha corrompido nuestra orden! Para que el mal encuentre aliados aquí, tiene que ser muy poderoso.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_06"); //Pedro llevaba años en el monasterio. Creo que el tiempo que pasó fuera de estos muros hizo que su fe flaquease y le hizo vulnerable a las tentaciones de Beliar.
		}
		else if (MIS_NovizenChase == LOG_SUCCESS)	//Kap 3c - Das Auge Innos ist wieder da
		{
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_07"); //Eres muy oportuno. Ni siquiera Innos habría elegido un mejor momento para tu aparición.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_08"); //Entrarás en los anales del monasterio como salvador del Ojo.
		}
		else //Kap 2 - 3a
		{
			if (MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output (self,other,"DIA_NOV_3_STANDARD_03_09"); //Las noticias del Valle de las Minas son alarmantes. Creo que Innos nos está sometiendo a una dura prueba..
			}
			else
			{
				AI_Output (self,other,"DIA_NOV_3_STANDARD_03_10"); //Se dice que no se sabe nada de los paladines que fueron al Valle de las Minas. El Concilio Supremo sabrá lo que hay que hacer.
			};
		};	
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_NOV_3_STANDARD_03_11"); //Dicen que destruiremos a los dragones con la ayuda de nuestro Señor. La cólera de Innos golpeará a las criaturas de Beliar.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_NOV_3_STANDARD_03_12"); //Gracias a Innos no hay nueva crisis. Debemos volver al sendero de nuestro Señor, pues solo nos podemos enfrentar al mal con su ayuda.

	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_NOV_3 (var c_NPC slf)
{
	DIA_NOV_3_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_3_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_3_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_3_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_3_STANDARD.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_3_Fegen.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_3_Wurst.npc					= Hlp_GetInstanceID(slf);
};
