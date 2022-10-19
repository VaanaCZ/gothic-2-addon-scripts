// ***************
// B_Announce_Herold 
// ***************

func void B_Announce_Herold ()
{
	var int randy;
	if ( C_BodystateContains(self, BS_SIT) )
	{
		AI_StandUp		(self);
		B_TurnToNpc		(self,	hero);
	};
	
	// ------ NSC steckt ggf. Waffe weg ------
	AI_RemoveWeapon (self);
	
	CreateInvItem		(self,	Fakescroll);
	AI_UseItemToState	(self,	Fakescroll,	1);

	AI_Output (self ,self,"DIA_Herold_Announce_04_00"); //�Escuchad, habitantes de Khorinis! Por orden expl�cita del honorable lord Hagen, se promulga el siguiente decreto.
	
	if (Kapitel <= 2)
	{
		randy = Hlp_Random (5);
		if (randy == 0)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_01"); //A causa de la situaci�n general, y por vuestra propia protecci�n, ten�is que evitar las zonas boscosas y agrestes que circundan la ciudad.
			AI_Output (self ,self,"DIA_Herold_Announce_04_02"); //Adem�s, se proh�be terminantemente el contacto con el campesinado rebelde de los alrededores.
		}
		else if (randy == 1)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_03"); //De ahora en adelante, lord Andre tomar� el mando absoluto de la milicia.
			AI_Output (self ,self,"DIA_Herold_Announce_04_04"); //Por la presente, se insta a todos los ciudadanos que cuenten con instrucci�n marcial a que se alisten en la milicia real.
		}
		else if (randy == 2)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_05"); //Se reforzar�n las medidas de seguridad destinadas a proteger el barrio alto.
			AI_Output (self ,self,"DIA_Herold_Announce_04_06"); //Los guardias de las puertas tienen orden de interpretar de manera estricta la ley para evitar cualquier entrada no autorizada.
		}
		else if (randy == 3)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_07"); //Se impone con efecto inmediato la ley marcial en todas las ciudades y regiones del reino.
			AI_Output (self ,self,"DIA_Herold_Announce_04_08"); //Todos los jueces civiles han de ceder sus atribuciones a los paladines reales, con efecto inmediato.
			AI_Output (self ,self,"DIA_Herold_Announce_04_09"); //El honorable lord Andre tiene orden de castigar con severidad todo delito o acto de resistencia contra la guardia del rey.
			AI_Output (self ,self,"DIA_Herold_Announce_04_10"); //Todo habitante de Khorinis que sea culpable de un delito ha de presentarse de inmediato ante lord Andre.
		}
		else
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_11"); //A causa del peligro inminente de que se produzca un ataque orco, cada habitante de la ciudad ha de prepararse de manera adecuada.
			AI_Output (self ,self,"DIA_Herold_Announce_04_12"); //Todo el mundo tiene que iniciar de inmediato su instrucci�n de combate, y ha de armarse adecuadamente.
		};
	}
	else if (Kapitel == 3)
	{
		IF (MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_13"); //El herrero mercenario Bennet, que asesin� a traici�n al palad�n Lothar, ha sido condenado en nombre de Innos.
			AI_Output (self ,self,"DIA_Herold_Announce_04_14"); //Se le sentencia a morir en la horca. La ejecuci�n tendr� lugar dentro de unos d�as.
		}
		else
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_15"); //Se ha absuelto de toda culpa al herrero Bennet, porque un h�bil consejero de lord Hagen demostr� su inocencia.
		};	
	}
	else if (Kapitel == 4)
	{
			AI_Output (self ,self,"DIA_Herold_Announce_04_16"); //Los rumores que han surgido acerca de la aparici�n de dragones en el Valle de las Minas de Khorinis no son dignos de cr�dito.
			AI_Output (self ,self,"DIA_Herold_Announce_04_17"); //El enemigo se dedica a propagar estos rumores para inspirar miedo y terror en el pueblo valiente de Myrtana.
			AI_Output (self ,self,"DIA_Herold_Announce_04_18"); //Para refutar estas afirmaciones rid�culas, ha partido hacia el Valle de las Minas una compa��a de valientes paladines bajo las �rdenes de alguien familiarizado con la regi�n.
	}
	else	//Kapitel 5
	{
		randy = Hlp_Random (2);
		if (randy == 0)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_19"); //Los dragones que amenazaban el pa�s han sido derrotados por hombres valientes bajo las �rdenes de lord Hagen.
			AI_Output (self ,self,"DIA_Herold_Announce_04_20"); //Dentro de poco, el rey Rhobar habr� liberado el pa�s de orcos y el reino florecer� con nuevo esplendor.
		}
		else
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_21"); //Lord Andre quedar� al cargo de la ciudad de Khorinis, con efecto inmediato.
			AI_Output (self ,self,"DIA_Herold_Announce_04_22"); //Lord Hagen ha anunciado que ir� en persona al Valle de las Minas para asegurarse que se cargue su nave de mineral m�gico.
		};
	};
	AI_UseItemToState	(self,	Fakescroll,	-1);
};


/* 

			AI_Output (self ,self,"DIA_Herold_Announce_04_00"); //H�rt B�rger von Khorinis den Beschlu� des ehrenwerten Lord Hagen!
			AI_Output (self ,self,"DIA_Herold_Announce_04_02"); //An alle B�rger von Khorinis, vernehmt Lord Hagens Anordnungen zum Schutze unserer Stadt. 
			AI_Output (self ,self,"DIA_Herold_Announce_04_09"); //H�rt ihr Bewohner von Khorinis und vernehmt das k�nigliche Dekret zur Aufrechterhaltung der �ffentlichen Ordnung.
			AI_Output (self ,self,"DIA_Herold_Announce_04_09"); //An alle Bewohner von Khorinis, vernehmt Lord Hagens Anordnungen zum Schutze unserer Stadt. 





Kapitel 3 Spieler kommt aus dem Minental und hat mit Lord Hagen gesprochen
H�rt ihr B�ger von Khorinis. Ein Bote der Paladine brachte Kunde aus dem Minental
Unsere tapferen Paladine halten den Orks wehrhaft stand und erschliessen neue Minen f�r das K�nigreich!

Kapitel 3 Bennet ist im Knast
H�rt ihr B�rger von Khorinis
Der Schmied Bennet, der den ehrenwerten Paladin Lothar heimt�ckisch ermordert hat, ist im Namen Innos verurteilt worden. 
Das Urteil lautet Tod durch den Strick.

Kapitel 3 Bennet ist wieder frei
H�rt ihr B�rger,
Der Schmied Bennet wird freigesprochen, da seine Unschuld von einem klugen Berater Lord Hagens bewiesen wurde. 
So ist es Innos Wille und nach seiner Gerechtigkeit handeln wir. 
 
Kapitel 5 Start Drachen sind tot
H�rt B�rger von Khorinis
Die Drachen die das Land bedrohten wurden von tapferen M�nnern unter dem Befehl von Lord Hagen besiegt.   
Bald wird auch K�nig Rohbar das Land von den Orks befreien und das K�nigreich wird in neuem Glanz aufbl�hen!


Kapitel 5 Kurz vor Schlu� (Spieler war in der Biblothek) 
Der ehrenwerte Lord Hagen hat verk�ndet nun selbst ins Minental zu ziehen um daf�r zu sorgen das sein Schiff mit dem Erz beladen werden kann.  

*/
