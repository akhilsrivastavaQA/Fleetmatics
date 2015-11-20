using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Fleetmatics
{
    class Rabbits
    {

        internal static List<RabbitPair> rabbits = new List<RabbitPair>();

        public static int RabbitCount(int month)
        {

            //add magically appeared pair of rabbits
            if (month >= 0)
            {
                rabbits.Add(new RabbitPair());
            }

            for (int m = 1; m <= month; m++)
            {
                IEnumerator<RabbitPair> itr = rabbits.GetEnumerator();
                int newPairs = 0;
                while (itr.MoveNext())
                {
                    RabbitPair rp = itr.Current;
                    rp.increaseAgeByAMonth();
                    if (rp.Mature)
                    {
                        //Rabbit pair is mature to give birth to babies
                        newPairs++;
                    }
                }

                for (int i = 0; i < newPairs; i++)
                {
                    rabbits.Add(new RabbitPair());
                }
            }

            return rabbits.Count;
        }

        public static void Main(string[] args)
        {
            Console.WriteLine(RabbitCount(12));
            Console.Read();
        }
    }

    internal class RabbitPair
    {
        internal int age = 0;

        public virtual void increaseAgeByAMonth()
        {
            age++;
        }

        public virtual int Age
        {
            set
            {
                this.age = value;
            }
            get
            {
                return age;
            }
        }


        public virtual bool Mature
        {
            get
            {
                return (age >= 3) ? true : false;
            }


        }
    }
}
