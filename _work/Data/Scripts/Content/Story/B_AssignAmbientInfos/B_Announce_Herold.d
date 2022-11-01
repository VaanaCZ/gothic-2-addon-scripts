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

	AI_Output (self ,self,"DIA_Herold_Announce_04_00"); //¡Escuchad, habitantes de Khorinis! Por orden explícita del honorable lord Hagen, se promulga el siguiente decreto.
	
	if (Kapitel <= 2)
	{
		randy = Hlp_Random (5);
		if (randy == 0)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_01"); //A causa de la situación general, y por vuestra propia protección, tenéis que evitar las zonas boscosas y agrestes que circundan la ciudad.
			AI_Output (self ,self,"DIA_Herold_Announce_04_02"); //Además, se prohíbe terminantemente el contacto con el campesinado rebelde de los alrededores.
		}
		else if (randy == 1)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_03"); //De ahora en adelante, lord Andre tomará el mando absoluto de la milicia.
			AI_Output (self ,self,"DIA_Herold_Announce_04_04"); //Por la presente, se insta a todos los ciudadanos que cuenten con instrucción marcial a que se alisten en la milicia real.
		}
		else if (randy == 2)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_05"); //Se reforzarán las medidas de seguridad destinadas a proteger el barrio alto.
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
			AI_Output (self ,self,"DIA_Herold_Announce_04_12"); //Todo el mundo tiene que iniciar de inmediato su instrucción de combate, y ha de armarse adecuadamente.
		};
	}
	else if (Kapitel == 3)
	{
		IF (MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_13"); //El herrero mercenario Bennet, que asesinó a traición al paladín Lothar, ha sido condenado en nombre de Innos.
			AI_Output (self ,self,"DIA_Herold_Announce_04_14"); //Se le sentencia a morir en la horca. La ejecución tendrá lugar dentro de unos días.
		}
		else
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_15"); //Se ha absuelto de toda culpa al herrero Bennet, porque un hábil consejero de lord Hagen demostró su inocencia.
		};	
	}
	else if (Kapitel == 4)
	{
			AI_Output (self ,self,"DIA_Herold_Announce_04_16"); //Los rumores que han surgido acerca de la aparición de dragones en el Valle de las Minas de Khorinis no son dignos de crédito.
			AI_Output (self ,self,"DIA_Herold_Announce_04_17"); //El enemigo se dedica a propagar estos rumores para inspirar miedo y terror en el pueblo valiente de Myrtana.
			AI_Output (self ,self,"DIA_Herold_Announce_04_18"); //Para refutar estas afirmaciones ridículas, ha partido hacia el Valle de las Minas una compañía de valientes paladines bajo las órdenes de alguien familiarizado con la región.
	}
	else	//Kapitel 5
	{
		randy = Hlp_Random (2);
		if (randy == 0)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_19"); //Los dragones que amenazaban el país han sido derrotados por hombres valientes bajo las órdenes de lord Hagen.
			AI_Output (self ,self,"DIA_Herold_Announce_04_20"); //Dentro de poco, el rey Rhobar habrá liberado el país de orcos y el reino florecerá con nuevo esplendor.
		}
		else
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_21"); //Lord Andre quedará al cargo de la ciudad de Khorinis, con efecto inmediato.
			AI_Output (self ,self,"DIA_Herold_Announce_04_22"); //Lord Hagen ha anunciado que irá en persona al Valle de las Minas para asegurarse que se cargue su nave de mineral mágico.
		};
	};
	AI_UseItemToState	(self,	Fakescroll,	-1);
};


/* 

			AI_Output (self ,self,"DIA_Herold_Announce_04_00"); //Hört Bürger von Khorinis den Beschluß des ehrenwerten Lord Hagen!
			AI_Output (self ,self,"DIA_Herold_Announce_04_02"); //An alle Bürger von Khorinis, vernehmt Lord Hagens Anordnungen zum Schutze unserer Stadt. 
			AI_Output (self ,self,"DIA_Herold_Announce_04_09"); //Hört ihr Bewohner von Khorinis und vernehmt das königliche Dekret zur Aufrechterhaltung der öffentlichen Ordnung.
			AI_Output (self ,self,"DIA_Herold_Announce_04_09"); //An alle Bewohner von Khorinis, vernehmt Lord Hagens Anordnungen zum Schutze unserer Stadt. 





Kapitel 3 Spieler kommt aus dem Minental und hat mit Lord Hagen gesprochen
Hört ihr Büger von Khorinis. Ein Bote der Paladine brachte Kunde aus dem Minental
Unsere tapferen Paladine halten den Orks wehrhaft stand und erschliessen neue Minen für das Königreich!

Kapitel 3 Bennet ist im Knast
Hört ihr Bürger von Khorinis
Der Schmied Bennet, der den ehrenwerten Paladin Lothar heimtückisch ermordert hat, ist im Namen Innos verurteilt worden. 
Das Urteil lautet Tod durch den Strick.

Kapitel 3 Bennet ist wieder frei
Hört ihr Bürger,
Der Schmied Bennet wird freigesprochen, da seine Unschuld von einem klugen Berater Lord Hagens bewiesen wurde. 
So ist es Innos Wille und nach seiner Gerechtigkeit handeln wir. 
 
Kapitel 5 Start Drachen sind tot
Hört Bürger von Khorinis
Die Drachen die das Land bedrohten wurden von tapferen Männern unter dem Befehl von Lord Hagen besiegt.   
Bald wird auch König Rohbar das Land von den Orks befreien und das Königreich wird in neuem Glanz aufblühen!


Kapitel 5 Kurz vor Schluß (Spieler war in der Biblothek) 
Der ehrenwerte Lord Hagen hat verkündet nun selbst ins Minental zu ziehen um dafür zu sorgen das sein Schiff mit dem Erz beladen werden kann.  

*/
